pkgname=aha
pkgver=0.4.10.3
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('any')
url="https://github.com/theZiz/aha"
license=('MPL' 'LGPL')
provides=('aha')
conflicts=('aha')

source=("$url/archive/${pkgver}.tar.gz")
sha512sums=('965dd1bb6f893435661e02748226db2600f063d7c43f6569e1f898e5c0545ca54140a2355377f0b9f729f202ee58f26c61e1e1574a572d5f16542976a05fb74a')

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
