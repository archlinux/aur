# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.16
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/ff3f148d3260010b63308c8b40a445b0f31667a4.zip")
sha256sums=('7dba9e8cfa2a7f36daafefda673280778a877f4c0a838d94f205aeee6b4ae65e')

build() {
    cd $pkgname-ff3f148d3260010b63308c8b40a445b0f31667a4

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-ff3f148d3260010b63308c8b40a445b0f31667a4

    cd build
    make install INSTALL_ROOT=$pkgdir
}
