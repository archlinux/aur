#Contributor: Brian Bidulock <bidulock@openss7.org>
pkgname=xorg-beforelight
_pkgname=beforelight
pkgdesc="MIT-SCREEN-SAVER sample"
pkgver=1.0.6
pkgrel=1
arch=('x86_64' 'i686')
url="http://www.x.org/"
license=('custom')
depends=('libxss' 'libxt')
source=("http://xorg.freedesktop.org/releases/individual/app/$_pkgname-$pkgver.tar.gz")
md5sums=('25f93f57081f4948e8ee31b5a89e3efe')

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
