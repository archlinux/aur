# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.23
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/d76a0d1fdded0ee8a144f752ac63d225218564b6.zip")
sha256sums=('7e617484191840bb4ba2c6750671d589e7394b61f6c2461fa76b4a39e41646fa')

build() {
    cd mpz-d76a0d1fdded0ee8a144f752ac63d225218564b6

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-d76a0d1fdded0ee8a144f752ac63d225218564b6

    cd build
    make install INSTALL_ROOT=$pkgdir
}
