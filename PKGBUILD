# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.16
pkgrel=3
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/6d82b66ee47f297118c9c209f707725fccc1eeff.zip")
sha256sums=('0ef5d8b5545051b435b941523c821e4568b7c09f4c9379f0a45d0e720b774bc9')

build() {
    cd $pkgname-6d82b66ee47f297118c9c209f707725fccc1eeff

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-6d82b66ee47f297118c9c209f707725fccc1eeff

    cd build
    make install INSTALL_ROOT=$pkgdir
}
