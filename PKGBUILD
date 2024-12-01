# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=1.0.26
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/7d16bbff42b6b0ee504e2b9e3129483d33b614d6.zip")
sha256sums=('aad14c7bdd3ea61d6846d598fb14101e54079512f0285573a50bf16fea62ddfa')

build() {
    cd mpz-7d16bbff42b6b0ee504e2b9e3129483d33b614d6

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-7d16bbff42b6b0ee504e2b9e3129483d33b614d6

    cd build
    make install INSTALL_ROOT=$pkgdir
}
