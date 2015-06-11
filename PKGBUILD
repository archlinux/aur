#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-xsetmode
_pkgname=xsetmode
pkgdesc="Set an X input device as the main pointer"
pkgver=1.0.0
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxi')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('d074e79d380b031d2f60e4cd56538c93')

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
