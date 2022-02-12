# Maintainer: blinry <mail@blinry.org>

pkgname=microw8
pkgver=0.1.1
pkgrel=1
pkgdesc="WebAssembly based fantasy console"
arch=('x86_64')
url="https://exoticorn.github.io/microw8/"
license=('Unlicense')
source=(https://github.com/exoticorn/microw8/releases/download/v$pkgver/microw8-$pkgver-linux.tgz)
sha256sums=('fa585cc96fbc54819662c2e438f463c20aee9539fc779c3b85c278c18fb19316')

package() {
  cd "$srcdir/microw8-linux/"
  install -Dm755 uw8 "$pkgdir/usr/bin/uw8"
  install -Dm644 README.md "$pkgdir/usr/share/doc/microw8/README.md"
  install -Dm644 microw8.html "$pkgdir/usr/share/doc/microw8/microw8.html"
  install -Dm644 examples/* -t "$pkgdir/usr/share/doc/microw8/examples/"
  install -Dm644 carts/* -t "$pkgdir/usr/share/doc/microw8/carts/"
}
