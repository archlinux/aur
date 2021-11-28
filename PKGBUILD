# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.18
pkgrel=6
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/dd92ed5650f843d0e1dc587ebb04809bc1336380.zip")
sha256sums=('3c03aa4a40ecc4f3e1185bf095d98b106789769b8b2a14e9c0b06719b5d2b12d')

build() {
    cd $pkgname-dd92ed5650f843d0e1dc587ebb04809bc1336380

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-dd92ed5650f843d0e1dc587ebb04809bc1336380

    cd build
    make install INSTALL_ROOT=$pkgdir
}
