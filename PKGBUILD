_pkgname=aha
pkgname=aha-git
pkgver=0.5.1.14.g5eaec96
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('x86_64')
makedepends=('git')
url="https://github.com/theZiz/aha"
license=('MPL-1.1' 'LGPL-2.0-or-later')
provides=('aha')
conflicts=('aha')

source=('git+https://github.com/theZiz/aha.git#branch=master')
sha512sums=('SKIP')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git describe --tags | sed "s/-/./g"
}

build() {
  cd -- "$srcdir/$_pkgname"
  make
}

package() {
  cd -- "$srcdir/$_pkgname"
  install -Dm755 "aha" "$pkgdir/usr/bin/aha"
  install -Dm644 "aha.1" "$pkgdir/usr/share/man/man1/aha.1"
}

# vim:set ts=2 sw=2 et:
