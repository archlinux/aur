# Maintainer: Muhammad Herdiansyah <herdiansyah@netc.eu>
# Contributor: Alexander Keller <git@nycroth.com>
pkgname=sinit
pkgver=1.1
pkgrel=1
pkgdesc="Suckless init"
url="http://tools.suckless.org/sinit/"
arch=('i686' 'x86_64')
license=('MIT')
install=sinit.install
source=("http://git.suckless.org/sinit/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('9bde111e0aff516f13381517dbad9270')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp "$srcdir/../config.h" "config.h"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
