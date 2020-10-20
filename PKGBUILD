# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.5
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/1729436efd5d99bb6e93641380a1e5c3a841a67e.zip")
sha256sums=('d1d335e246d965916cf4f2321e024c90961e08a56a967ef1f38bc5a1550a940d')

build() {
    cd $pkgname-1729436efd5d99bb6e93641380a1e5c3a841a67e

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-1729436efd5d99bb6e93641380a1e5c3a841a67e

    cd build
    make install INSTALL_ROOT=$pkgdir
}
