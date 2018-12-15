# Maintainer: Jakub Trnka <jakub.trnka@chainanalytics.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname=trezor-bridge-bin
pkgver=2.0.25
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
sha256sums_i686=('e23356482a871339284b3e4675ff14e7e250c8f3c76e704f44e85cc4c40061ad')
sha256sums_x86_64=('e3c8d16cae1570680267319096a5aa8a843f7bf15fc6eb6d109b97e755e3f99c')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib/
    
    msg2 "Cleaning up..."
    rm -r "$pkgdir"/lib/
}
