# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.11
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/8726356efc540afda3c83d988777a216e6871200.zip")
sha256sums=('18b7c2a97c2de9b8b74998d6d658d1f0fca7e0364b784dd53edf4834d7c4d14b')

build() {
    cd $pkgname-8726356efc540afda3c83d988777a216e6871200

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-8726356efc540afda3c83d988777a216e6871200

    cd build
    make install INSTALL_ROOT=$pkgdir
}
