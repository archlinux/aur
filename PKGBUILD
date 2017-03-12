pkgname=aha
pkgver=0.4.10.5
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('any')
url="https://github.com/theZiz/aha"
license=('MPL' 'LGPL')
provides=('aha')
conflicts=('aha')

source=("$url/archive/${pkgver}.tar.gz")
sha512sums=('cd7245a333f1eb4fd941397a98849dbcc6589a0a0591bb50937d2d5a2e3c98db02da2ad57bea183a9c04d1504d8e2e1087ac5a9fb4e5d72ff3140bbd76f05c51')

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver"
  install -Dm755 "aha" "$pkgdir/usr/bin/aha"
  install -Dm644 "aha.1" "$pkgdir/usr/share/man/man1/aha.1"
}

# vim:set ts=2 sw=2 et:
