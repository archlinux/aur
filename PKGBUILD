# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libcork
pkgver=0.15.0
pkgrel=1
pkgdesc="A simple, easily embeddable cross-platform C library"
arch=('i686' 'x86_64')
url="https://github.com/redjack/libcork"
license=('BSD')
groups=()
depends=('pkg-config')
makedepends=('cmake' 'check')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/redjack/libcork.git#tag=$pkgver)
noextract=()
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
    cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
