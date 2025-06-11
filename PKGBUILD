# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=tack
pkgver=1.11
pkgrel=1
pkgdesc="A program that can be used to verify or refine a terminfo (terminal information) description of a terminal."
arch=('i686' 'x86_64')
url="http://invisible-island.net/ncurses/tack.html"
license=('custom')
changelog="$pkgname.changelog"
provides=('tack')
depends=('ncurses')
source=("https://invisible-mirror.net/archives/ncurses/${pkgname}-${pkgver}.tgz")
sha512sums=('94364627b58c949073b9b8acbffce62ca74e0204311d8b06cc9957b75faeb3b3beaf707e2b400c63a36f813003d2d85abc5b85e35f1b94230b4991d7b12b82c9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --bindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



