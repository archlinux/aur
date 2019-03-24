# Maintainer: mwberry <matt@comp.uter.science>

pkgname=re2c-git
pkgver=1.1.1_253_ga6cde618
pkgrel=1
pkgdesc='lexer generator for C/C++ http://re2c.org'
arch=(x86_64)
url='http://re2c.org'
license=(custom)
makedepends=() # base-devel is sufficient
depends=()
source=(git://github.com/skvadrik/re2c)
sha1sums=('SKIP')
provides=('re2c')
conflicts=('re2c')

pkgver() {
  cd "$srcdir/re2c"
  git describe --long --tags | tr '-' '_'
}

build() {
  cd "$srcdir/re2c"
  ./autogen.sh
  ./configure --prefix="$pkgdir/usr/"
  make
}

package() {
  cd "$srcdir/re2c"
  make install
  install -Dm644 "$srcdir/re2c/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

