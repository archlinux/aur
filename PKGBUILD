# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=fbautostart
pkgver=2.718281828
pkgrel=3
pkgdesc="Lightweight XDG autostarter for Fluxbox"
arch=('i686' 'x86_64')
url="https://launchpad.net/fbautostart"
depends=('gcc-libs')
license=('MIT') #looks like MIT, launchpad says it's GNU GPL v3 
source=("https://launchpad.net/$pkgname/$pkgname/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('06495f9b23b1c9b1bf35c2346cb48f63')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
