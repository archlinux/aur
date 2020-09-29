# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.14
pkgrel=15
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=('$pkgname-$pkgver.zip::https://github.com/olegantonyan/mpz/archive/master.zip')
sha256sums=('feb6292299aca0e71de3eb6f351b87c3b3b453a50ee73ddd7d24c885417859c0')

build() {
    cd $pkgname-$pkgver

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-$pkgver

    cd build
    make install INSTALL_ROOT=$pkgdir
}
