# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=minizip-git
_pkgname=minizip
epoch=2
pkgver=1.2.11
pkgrel=1
arch=('x86_64')
license=('custom')
url="https://github.com/nmoinvaz/minizip"
depends=('glibc')
makedepends=('git' 'cmake')
conflicts=('minizip')
source=("git+https://github.com/nmoinvaz/minizip.git")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON .
    make
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}

