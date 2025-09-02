# Maintainer: Valter Nazianzeno <manipuladordedados@gmail.com>
pkgname=tocaia
pkgver=0.9.0
pkgrel=1
pkgdesc="Portable TUI Gopher client written in C89 for POSIX systems"
arch=('i686' 'x86_64')
url="https://github.com/manipuladordedados/tocaia"
license=('BSD-2-Clause')
depends=()
makedepends=('git' 'gcc' 'make')
source=("${pkgname}::git+https://github.com/manipuladordedados/tocaia.git#tag=${pkgver}")
md5sums=('SKIP')

options=(!debug strip)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
