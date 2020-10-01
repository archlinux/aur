# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.14
pkgrel=25
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/master.zip")
sha256sums=('6ee46e32bfa6e1889a3ccae552856054c6870fc29b5504e9b966ab23a607b85e')

build() {
    cd $pkgname-master

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-master

    cd build
    make install INSTALL_ROOT=$pkgdir
}
