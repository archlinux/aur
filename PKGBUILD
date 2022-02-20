# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.19
pkgrel=24
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/3c0daf7457ff9e69a6230881f25c5b0cb1aceef5.zip")
sha256sums=('cb856236972e5a7ea6b971defa84b8e824f840aec838cb516253d7e9690311a7')

build() {
    cd mpz-3c0daf7457ff9e69a6230881f25c5b0cb1aceef5

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release ..
    make
}

package() {
    cd mpz-3c0daf7457ff9e69a6230881f25c5b0cb1aceef5

    cd build
    make install INSTALL_ROOT=$pkgdir
}
