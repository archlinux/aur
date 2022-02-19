# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.19
pkgrel=13
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme')
provides=('mpz-qt6')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/61e699348d9c47fb5498f7547b08df21550dd2de.zip")
sha256sums=('2e34c7b4efd3b83f079469f9eef914dd22808694d99f26d5720a07d04087d751')

build() {
    cd mpz-61e699348d9c47fb5498f7547b08df21550dd2de

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release ..
    make
}

package() {
    cd mpz-61e699348d9c47fb5498f7547b08df21550dd2de

    cd build
    make install INSTALL_ROOT=$pkgdir
}
