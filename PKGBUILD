# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=xdrfile
pkgver=2.1.2
pkgrel=2
pkgdesc='Reads/writes compressed trajectory files.'
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('cmake')
source=(https://github.com/wesbarnett/lib${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('1c32261df46f2762ef69aa81716e168f706c7b78d55c7c5e11632f082a3af96248f15e5a515352277ce89209ffda18b8084471ad097ecd3963c507475b724d70')

build() {
    mkdir -p build
    cd build
    cmake ${srcdir}/lib${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd build
    make test
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
}
