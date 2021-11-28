# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.17
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/00f8e93d873bbcf3b9af6f5ac64bacffe7f21fc6.zip")
sha256sums=('28eca6d5c7599d0f07567abd8cbebd47d190fbee834d0813f96f1159b501b37c')

build() {
    cd $pkgname-00f8e93d873bbcf3b9af6f5ac64bacffe7f21fc6

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-00f8e93d873bbcf3b9af6f5ac64bacffe7f21fc6

    cd build
    make install INSTALL_ROOT=$pkgdir
}
