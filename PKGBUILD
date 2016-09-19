# Maintainer: Jestine Paul <jestine dot paul at gmail dot com>

pkgname=ntl-threading
pkgver=9.10.0
pkgrel=1
pkgdesc="A Library for doing Number Theory"
arch=(i686 x86_64)
url="http://www.shoup.net/ntl/"
license=(GPL)
depends=(gf2x gmp)
provides=('ntl')
makedepends=()
source=("http://www.shoup.net/ntl/ntl-$pkgver.tar.gz")
md5sums=('3846639577fc4bcba30f45e079d82a69')

build() {
  cd ntl-$pkgver/src
  ./configure DEF_PREFIX=/usr SHARED=on NTL_GF2X_LIB=on NTL_THREADS=on NTL_THREAD_BOOST=on NTL_GMP_LIP=on
  make
}

check() {
  cd ntl-$pkgver/src
  make -k check
}

package() {
  cd ntl-$pkgver/src
  make PREFIX="$pkgdir/usr" install
}
