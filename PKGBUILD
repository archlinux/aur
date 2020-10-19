# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.4
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/995d00012aafc781e22a67129257db63b3c9b7df.zip")
sha256sums=('e6b2a31426225fe388f0d510a4ef069799b2d7d3d157ce174d050c9a35dbbcf0')

build() {
    cd $pkgname-995d00012aafc781e22a67129257db63b3c9b7df

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-995d00012aafc781e22a67129257db63b3c9b7df

    cd build
    make install INSTALL_ROOT=$pkgdir
}
