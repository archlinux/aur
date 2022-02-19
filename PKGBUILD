# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=6
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/7e6d7222edfdabbab8322bd095e74b02b9be9d79.zip")
sha256sums=('cb5c394748ecccee28cab099822a78cc37aff157c96910e794614400704cd22a')

build() {
    cd $pkgname-7e6d7222edfdabbab8322bd095e74b02b9be9d79

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-7e6d7222edfdabbab8322bd095e74b02b9be9d79

    cd build
    make install INSTALL_ROOT=$pkgdir
}
