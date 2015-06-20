# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=libck
pkgver=0.4.5
pkgrel=1
pkgdesc="A concurrency primitives, safe memory reclamation mechanisms C library"
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
license=('BSD')
depends=('glibc')
source=($url/releases/ck-$pkgver.tar.gz)
sha256sums=('89feea338cd6a8efbe7bd64d033cefccb34775ea0bedbcb1612df2b822fa0356')
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

