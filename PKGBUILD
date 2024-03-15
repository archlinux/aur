# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=1.0.24
pkgrel=14
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/3725435b8ac95eab80849fa28e6c8ac0f24bedc6.zip")
sha256sums=('6df4aaddcc3d56557ff175d9d9627e87fbb343ceea976137cf4f77e151c025e8')

build() {
    cd mpz-3725435b8ac95eab80849fa28e6c8ac0f24bedc6

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-3725435b8ac95eab80849fa28e6c8ac0f24bedc6

    cd build
    make install INSTALL_ROOT=$pkgdir
}
