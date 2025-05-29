# Maintainer: lolop at opmbx dot org
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: C�dric Barboiron <ced@winkie.fr>

pkgname=wmcoincoin
pkgver=2.6.3
pkgrel=2
pkgdesc="rss/board (like linuxfr.org's one) browser"
arch=(i686 x86_64)
url="http://hules.free.fr/wmcoincoin/"
license=(GPLv2)
depends=(gtk2 imlib2 libxmu)
makedepends=(pkgconfig)
source=(http://hules.free.fr/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('ce2c4e08df0d9caf0663cbbb631da5de')


build() {
  cd $srcdir/$pkgname-$pkgver

  export CFLAGS="${CFLAGS} -std=gnu17"
  ./configure --prefix=/usr --enable-wmcoincoin_player
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
  #make prefix=$pkgdir/usr install
}
