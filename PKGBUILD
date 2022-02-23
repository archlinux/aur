# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=38
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/b8090ba6c92bdc866b391a3b1fa72a05bba63a06.zip")
sha256sums=('7ae22d3d53348d53a64d6d6d583da787d3d34e929b9e6c551fb2ed4abc53f30b')

build() {
    cd mpz-b8090ba6c92bdc866b391a3b1fa72a05bba63a06

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-b8090ba6c92bdc866b391a3b1fa72a05bba63a06

    cd build
    make install INSTALL_ROOT=$pkgdir
}
