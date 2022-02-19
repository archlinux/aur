# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=17
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
conflicts=('mpz-qt6')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/6999ea548e921118e90b9cdd46eb549d93185456.zip")
sha256sums=('d9c1fff79f130be1145695856bbb5fc14aeb04c0682f0016e15065d804bcfaf2')

build() {
    cd mpz-6999ea548e921118e90b9cdd46eb549d93185456

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd mpz-6999ea548e921118e90b9cdd46eb549d93185456

    cd build
    make install INSTALL_ROOT=$pkgdir
}
