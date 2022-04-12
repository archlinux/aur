# Maintainer: Fabian Brosda <fabi3141@gmx.de>
pkgname=gauche-json-c
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Fast parse-json via json-c in gauche."
arch=('i686' 'x86_64')
url="https://github.com/fbrosda/gauche-json-c"
license=('BSD')
depends=('gauche' 'json-c')
makedepends=('make' 'git')
source=('git+https://github.com/fbrosda/gauche-json-c#commit=da26a856dca4c2b17160142b8aa1572ad9fdd41a')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname"

  make -k check
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
