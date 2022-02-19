# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.19
pkgrel=17
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme')
provides=('mpz-qt6')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/6999ea548e921118e90b9cdd46eb549d93185456.zip")
sha256sums=('d9c1fff79f130be1145695856bbb5fc14aeb04c0682f0016e15065d804bcfaf2')

build() {
    cd mpz-6999ea548e921118e90b9cdd46eb549d93185456

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release ..
    make
}

package() {
    cd mpz-6999ea548e921118e90b9cdd46eb549d93185456

    cd build
    make install INSTALL_ROOT=$pkgdir
}
