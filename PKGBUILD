# Maintainer: Alexander Keller <git@nycroth.com>
pkgname=sinit
pkgver=1.0
pkgrel=1
pkgdesc="A simple init"
url="http://tools.suckless.org/sinit/"
arch=('i686' 'x86_64')
license=('MIT')
install=sinit.install
source=("http://dl.suckless.org/sinit/${pkgname}-${pkgver}.tar.gz")
md5sums=('9a15ec492278e2a2b29f8b25eda10286')

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
