# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thedesk-xdg-utils
pkgver=beta1
pkgrel=0
pkgdesc=""
arch=("x86_64")
url="https://github.com/vicr123/the24"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'the-libs' 'libtdesktopenvironment')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/thedesk-xdg-utils/archive/refs/tags/beta1.tar.gz")
sha256sums=('348f9378acc9035e1f04ea8962de482a092c7c578c7dd9fcf2f03e3581652a32')

build() {
    cd "$pkgname-$pkgver"

    mkdir build
    cd build
    
    qmake ..
    make
}

package() {
	cd "$pkgname-$pkgver/build"
	make install INSTALL_ROOT=$pkgdir
}
