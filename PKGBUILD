# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libck
pkgver=0.5.2
pkgrel=1
pkgdesc="A concurrency primitives, safe memory reclamation mechanisms C library"
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
license=('BSD')
depends=('glibc')
source=($url/releases/ck-$pkgver.tar.gz)
sha256sums=('5cf44b33f9279c653ec9b2b085d628c86336e4da18897be449f074283e5c5b3a')
noextract=()

build() {
    cd "$srcdir/ck-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/ck-$pkgver"
    make DESTDIR="$pkgdir/" install
}

