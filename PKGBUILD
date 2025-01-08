# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=tack
pkgver=1.10
pkgrel=1
pkgdesc="A program that can be used to verify or refine a terminfo (terminal information) description of a terminal."
arch=('i686' 'x86_64')
url="http://invisible-island.net/ncurses/tack.html"
license=('custom')
changelog="$pkgname.changelog"
provides=('tack')
depends=('ncurses')
source=("https://invisible-mirror.net/archives/ncurses/${pkgname}-${pkgver}.tgz")
sha512sums=('1be2cfaf769beb87824fbb6571c096725cf50e9df0f6abdf72bf8ce9c3a81445e4455f0469290ed0387b33554fc7d30b3a0b6a5424f9b026733c25e18cec6619')

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



