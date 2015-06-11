#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-beforelight
_pkgname=beforelight
pkgdesc="MIT-SCREEN-SAVER sample"
pkgver=1.0.5
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxss' 'libxt')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.bz2")
md5sums=('d587e2e64d63d0a33e7e911727f9ebd4')

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
