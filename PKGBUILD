# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: mocihan <ly50247@126.com>

pkgname=just-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='A handy way to save and run project-specific commands'
arch=("x86_64")
url="https://github.com/casey/just"
license=('custom:CC0')
provides=('just')
conflicts=('just')
source=("https://github.com/casey/just/releases/download/v${pkgver}/just-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
b2sums=('9212c346f6fb46b3a6656b6a5890319392f6581df4fe28bed9a0aeebc40482c59bc531fd083e9929c6f3e541727303a3be4ae1dece78afaaed7ef57f5f343e18')

package() {
  cd "$srcdir"
  install -Dm755 just "$pkgdir/usr/bin/just"
  install -Dm644 GRAMMAR.md "$pkgdir/usr/share/doc/just/GRAMMAR.md"
  install -Dm644 README.adoc "$pkgdir/usr/share/doc/just/README.adoc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/just/LICENSE"

  install -dm755 "$pkgdir/usr/share/man/man1"
  gzip -c --best just.1 > "$pkgdir/usr/share/man/man1/just.1.gz"
}
