# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=7
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
conflicts=('mpz-qt6')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/0ef21666b19ea036f180f80ab22a9b864e5980e7.zip")
sha256sums=('9ef8aa307574b0ba4495c53f9f0940802f5eefe22b618415f7809b6eefbfd20c')

build() {
    cd $pkgname-0ef21666b19ea036f180f80ab22a9b864e5980e7

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-0ef21666b19ea036f180f80ab22a9b864e5980e7

    cd build
    make install INSTALL_ROOT=$pkgdir
}
