# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libcork
pkgver=0.14.3
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
source=($pkgname-$pkgver.tar.gz::"https://github.com/redjack/$pkgname/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('0cad91de2613a88b1f520d7a457aaf841857570efe5ff2d2330c2df9c1942f01')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
