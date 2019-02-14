# Contributor: Immae <ismael.bouya@normalesup.org>
# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=tack
pkgver=1.08
pkgrel=1
pkgdesc="A program that can be used to verify or refine a terminfo (terminal information) description of a terminal."
arch=('i686' 'x86_64')
url="http://invisible-island.net/ncurses/tack.html"
license=('custom')
changelog="$pkgname.changelog"
provides=('tack')
depends=('ncurses')
source=("https://invisible-mirror.net/archives/ncurses/${pkgname}-${pkgver}.tgz")
sha512sums=('66dd4bb868087e6a8666119d32c873c8722453fe99d3eb58ab645aa0552771cca5d26f8b1fcccaf095d0316bceb011a49bc24a3b06fafc72cb2f59d251ec71d7')

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



