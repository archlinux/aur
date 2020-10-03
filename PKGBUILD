# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.15
pkgrel=10
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/f17707cbf496f86ddafda5f269348da8c6730218.zip")
sha256sums=('b4cbe80828bf5a7cbf637ee062983bf8217bb9a82c0d30e721e2e3e781753abf')

build() {
    cd $pkgname-f17707cbf496f86ddafda5f269348da8c6730218

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-f17707cbf496f86ddafda5f269348da8c6730218

    cd build
    make install INSTALL_ROOT=$pkgdir
}
