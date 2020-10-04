# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.17
pkgrel=3
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/e9bf1d3c2b9aa73fff7487426fd647d6b54ff60d.zip")
sha256sums=('757d4c15eb6d15aa600e6280b1cecfa5610abdcd3eab86372b122f72cfea4f73')

build() {
    cd $pkgname-e9bf1d3c2b9aa73fff7487426fd647d6b54ff60d

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-e9bf1d3c2b9aa73fff7487426fd647d6b54ff60d

    cd build
    make install INSTALL_ROOT=$pkgdir
}
