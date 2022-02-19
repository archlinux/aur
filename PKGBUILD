# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=13
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
conflicts=('mpz-qt6')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/61e699348d9c47fb5498f7547b08df21550dd2de.zip")
sha256sums=('2e34c7b4efd3b83f079469f9eef914dd22808694d99f26d5720a07d04087d751')

build() {
    cd mpz-61e699348d9c47fb5498f7547b08df21550dd2de

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd mpz-61e699348d9c47fb5498f7547b08df21550dd2de

    cd build
    make install INSTALL_ROOT=$pkgdir
}
