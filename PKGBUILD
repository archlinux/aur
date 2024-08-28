# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=1.0.25
pkgrel=2
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/7ab927da89604075e331c457dcdd180df070d42c.zip")
sha256sums=('36cd0363ee58679b33acc88bca54215674da4d9bffa0d1f1327d3774949fd656')

build() {
    cd mpz-7ab927da89604075e331c457dcdd180df070d42c

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-7ab927da89604075e331c457dcdd180df070d42c

    cd build
    make install INSTALL_ROOT=$pkgdir
}
