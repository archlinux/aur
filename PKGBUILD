#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-rstart
_pkgname=rstart
pkgdesc="Remote Start client"
pkgver=1.0.6
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('BSD')
depends=('bash')
makedepends=('xorgproto')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('e8e74a62d1270d02370ca6828f6ba625')
