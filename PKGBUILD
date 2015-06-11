#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xsetpointer
_pkgname=xsetpointer
pkgdesc="Set an X input device as the main pointer"
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxi')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('9e5bcbeda4aaf02bfa095e41d30baee4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
	--mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
