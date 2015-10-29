# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Mort Yao <mort.yao at gmail dot com>
# Contributor: karolina.lindqvist@kramnet.se

pkgname=algol68genie
pkgver=2.8.2
pkgrel=1
pkgdesc="Algol 68 Genie, an Algol 68 compiler-interpreter"
arch=('i686' 'x86_64')
url="http://www.xs4all.nl/~jmvdveer/algol.html"
license=('GPL')
depends=(gsl plotutils)
optdepends=('postgresql-libs: for postgresql support')
source=(http://jmvdveer.home.xs4all.nl/algol68g-$pkgver.tar.gz)
md5sums=('792194d0342e1e7213bd788a0df0f535')

build() {
  cd "$srcdir/algol68g-$pkgver"
  CFLAGS="$CFLAGS -O3 -fomit-frame-pointer -funroll-loops" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/algol68g-$pkgver"
  make DESTDIR="$pkgdir" docdir="/usr/share/doc/algol68g" install
}

