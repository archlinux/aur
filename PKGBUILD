# Maintainer: Erick Gallesio <eg at stklos net>
# Contributor: Jorge Silva <j0rj@posteo.net>

pkgname=stklos
pkgver=2.10
pkgrel=1
pkgdesc="Free R7RS Scheme system."
arch=('i686' 'x86_64')
url="http://www.stklos.net"
license=('GPL-2.0-or-later')
depends=('gmp' 'pcre2' 'libffi' 'gc')
optdepends=('readline: line editing and history support')
source=("http://www.stklos.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('15347ac3137b21a806a2da3ab899f17d')

prepare() {
   cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="-O3 -Wall -Wextra" LDFLAGS="" ./configure --enable-threads --prefix=/usr 
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
