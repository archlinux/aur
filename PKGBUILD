pkgname=aha
pkgver=0.4.8
pkgrel=1
pkgdesc="Ansi HTML Adapter: convert ANSI escape sequences to HTML."
arch=('i686' 'x86_64')
url="https://github.com/theZiz/aha"
license=('MPL' 'LPGL')
provides=('aha')
conflicts=('aha')

source=("$url/archive/${pkgver}.tar.gz")
sha512sums=('8d66ee7ec6d59873c1f0bedbc4deecd0c7b84c18069d2181d7b0563d9600821455c62c37c0af1774c7190ce08b14ec52f10bdf2c15a97fd29a2b6b095d5924fa')

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
