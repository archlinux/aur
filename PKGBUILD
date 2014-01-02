# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Marco Asa <marcoasa90 [at] gmail [dot] com>

pkgname=eperiodique
pkgver=0.5
pkgrel=1
pkgdesc="A simple Periodic Table Of Elements viewer using the EFL"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eperiodique/"
license=('BSD')
depends=('elementary')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('b2c15785e37e469ddb149e6110db453f4d2a97324e3d2998c34081505787d52d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
