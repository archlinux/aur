# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.16
pkgrel=2
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/0dcfab9ddaa477a51eef19a24fe86f2b87ea7cb8.zip")
sha256sums=('80192ce8038e0235ced7ea253721b966a1c2252c291a03de8e482e89f84f618a')

build() {
    cd $pkgname-0dcfab9ddaa477a51eef19a24fe86f2b87ea7cb8

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-0dcfab9ddaa477a51eef19a24fe86f2b87ea7cb8

    cd build
    make install INSTALL_ROOT=$pkgdir
}
