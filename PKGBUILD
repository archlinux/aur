# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Immae <ismael.bouya@normalesup.org>

pkgname=tack
_date=20251210
_ver=1.11
pkgver=$_ver.$_date
pkgrel=1
pkgdesc="A program that can be used to verify or refine a terminfo (terminal information) description of a terminal."
arch=('i686' 'x86_64')
url="https://invisible-island.net/ncurses/tack.html"
license=('custom')
changelog="$pkgname.changelog"
provides=('tack')
depends=('ncurses')
source=("https://invisible-mirror.net/archives/ncurses/current/${pkgname}-${_ver}-${_date}.tgz")
sha512sums=('5e0c03ecf493758c0e0d5c700b2a7d5e7201adb022a1792433cbe910b4909ac0b27cf4105a96bb682c41907d40de9d158d86b4f9310c90e384ac25ba62738c50')

build() {
  cd ${srcdir}/${pkgname}-${_ver}-${_date}
  ./configure --prefix=/usr --bindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/${pkgname}-${_ver}-${_date}
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



