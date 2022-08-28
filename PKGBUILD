# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.21
pkgrel=0
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/80b7e5c96de47d1b1838eb2178d1847bf936a2de.zip")
sha256sums=('ac9c1c11b44d6bde4090a57af221c5c30829f6c565edd691b00ab7af371a5f4a')

build() {
    cd mpz-80b7e5c96de47d1b1838eb2178d1847bf936a2de

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-80b7e5c96de47d1b1838eb2178d1847bf936a2de

    cd build
    make install INSTALL_ROOT=$pkgdir
}
