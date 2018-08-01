# Maintainer: Jakub Trnka <jakub.trnka@chainanalytics.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname=trezor-bridge-bin
pkgver=2.0.19
pkgrel=2
pkgdesc="Communication daemon for TREZOR"
arch=('i686' 'x86_64')
url="https://trezor.io/"
license=('LGPL3')
depends=('systemd')
makedepends=()
options=()
install=$pkgname.install
source_i686=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_i386.deb")
source_x86_64=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_amd64.deb")
sha256sums_i686=('f5b3a810602c9434f5b61be091c294d532fd08e6c4289ad76b8b0dbd05a69762')
sha256sums_x86_64=('ef01a113067b5c21f7327555a30f175009ae8778dec4bfb4e3d554fa694b07a0')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib/
    
    msg2 "Cleaning up..."
    rm -r "$pkgdir"/lib/
}
