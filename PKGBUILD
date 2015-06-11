# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <henrik at tunedal dot nu>
pkgname=wmtime
pkgver=1.0b2
pkgrel=3
pkgdesc="Analog/digital clock dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/time.html#wmtime"
license=('GPL')
depends=('libxpm')
source=("http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/files/$pkgname-$pkgver.tar.gz")
md5sums=('04c03e001aa702cf653b6b6c3f58bf87')

build() {
  cd "$srcdir/wmtime.app/wmtime"
  make
}

package() {
  cd "$srcdir/wmtime.app/wmtime"
  install -Dm755 wmtime "$pkgdir/usr/bin/wmtime"
  cd "$srcdir/wmtime.app"
  install -d "$pkgdir/usr/share/doc/wmtime"
  install -m444 BUGS CHANGES HINTS README TODO "$pkgdir/usr/share/doc/wmtime"
}
