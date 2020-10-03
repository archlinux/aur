# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.16
pkgrel=1
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/82d5443f4fbc6f421226a02cfce4678303c18f58.zip")
sha256sums=('d2cee023b80d11debf5c8c0606d52afe9210aa5aa5df8d3c1fd300096390c0a8')

build() {
    cd $pkgname-82d5443f4fbc6f421226a02cfce4678303c18f58

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-82d5443f4fbc6f421226a02cfce4678303c18f58

    cd build
    make install INSTALL_ROOT=$pkgdir
}
