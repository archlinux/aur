# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libck
pkgver=0.5.0
pkgrel=1
pkgdesc="A concurrency primitives, safe memory reclamation mechanisms C library"
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
license=('BSD')
depends=('glibc')
source=($url/releases/ck-$pkgver.tar.gz)
sha256sums=('55cbfaeace11bad65cd78ed663708652b8982f0c37bc49e6578e64dab1df3ff4')
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

