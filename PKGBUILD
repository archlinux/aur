# Maintainer: Fabian Brosda <fabi3141@gmx.de>
pkgname=gauche-json-c
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Fast parse-json via json-c in gauche."
arch=('i686' 'x86_64')
url="https://github.com/fbrosda/gauche-json-c"
license=('BSD')
depends=('gauche' 'json-c')
makedepends=('make')
source=('https://github.com/fbrosda/gauche-json-c/releases/download/v0.1.1/gauche-json-c-0.1.1.tgz')
sha256sums=('5e6ac326252f049a570d3485749976a52048a54857b282d216dd1558b8d7efc3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
