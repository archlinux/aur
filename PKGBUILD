# Maintainer: Jakub Trnka <jakub.trnka@chainanalytics.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname=trezor-bridge-bin
pkgver=2.0.27
pkgrel=1
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
sha256sums_i686=('fe750c227e4a7593142b959e29c41368a354fac25a9986158dfdd4fa7630a001')
sha256sums_x86_64=('ed7edb5cb33210af6faaf8a10f219525d8a1e551ea6f886cc6654b427f91e397')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib/
    
    msg2 "Cleaning up..."
    rm -r "$pkgdir"/lib/
}
