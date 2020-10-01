# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.15
pkgrel=5
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/7002c86bb8b59d560e0fd0b132c3f99ccac5d783.zip")
sha256sums=('ace191a892a3a25693ba7079159b6c6481d7b2c5567976dc20614ec1b1fd2d39')

build() {
    cd $pkgname-7002c86bb8b59d560e0fd0b132c3f99ccac5d783

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-7002c86bb8b59d560e0fd0b132c3f99ccac5d783

    cd build
    make install INSTALL_ROOT=$pkgdir
}
