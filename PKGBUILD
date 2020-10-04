# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.16
pkgrel=4
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/ea946e086e3ee6c1e364ed3ad33fb90db96d6ee4.zip")
sha256sums=('1e02a9507a5cc2c632fffad49c3f1a9ace0c0f289fc4b2ddf4740be4191b3346')

build() {
    cd $pkgname-ea946e086e3ee6c1e364ed3ad33fb90db96d6ee4

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-ea946e086e3ee6c1e364ed3ad33fb90db96d6ee4

    cd build
    make install INSTALL_ROOT=$pkgdir
}
