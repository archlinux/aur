# Maintainer: Fabian Brosda <fabi3141@gmx.de>
pkgname=gauche-json-c
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Fast parse-json via json-c in gauche."
arch=('i686' 'x86_64')
url="https://github.com/fbrosda/gauche-json-c"
license=('BSD')
depends=('gauche' 'json-c')
makedepends=('make')
source=('https://github.com/fbrosda/gauche-json-c/releases/download/v0.1.2/gauche-json-c-0.1.2.tgz')
sha256sums=('67c93b3b1f915d64bb827e52f208c502c8dd4f4e03bd7ada0b8c127ecfe3d838')

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
