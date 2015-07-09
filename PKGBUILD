# Contributor: Brian Bidulock <bidulock@openss7.org>
pkgname=fbautostart
pkgver=2.718281828
pkgrel=1
pkgdesc="Lightweight XDG autostarter for Fluxbox"
arch=('i686' 'x86_64')
url="https://launchpad.net/fbautostart"
depends=('gcc-libs')
license=('BSD')
source=("https://launchpad.net/$pkgname/$pkgname/$pkgver/+download/$pkgname-$pkgver.tar.gz" "LICENSE")
md5sums=('06495f9b23b1c9b1bf35c2346cb48f63'
         '3b20fd23a403ee99b09928d2c3b70e19')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
