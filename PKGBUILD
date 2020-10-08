# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.0
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/26b44043f8e244731d112f981618028097c307f4.zip")
sha256sums=('4a7caef6a4e8c82da482c04eef674e7977c3ae8845f597504614ca556a687137')

build() {
    cd $pkgname-26b44043f8e244731d112f981618028097c307f4

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-26b44043f8e244731d112f981618028097c307f4

    cd build
    make install INSTALL_ROOT=$pkgdir
}
