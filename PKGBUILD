# Maintainer: Stian HJ <stianhj@gmail.com>

pkgname=microw8-bin
_pkgname=microw8
pkgver=0.4.1
pkgrel=1
pkgdesc="WebAssembly based fantasy console"
arch=('x86_64')
url="https://exoticorn.github.io/microw8/"
license=('Unlicense')
source=(https://github.com/exoticorn/microw8/releases/download/v$pkgver/$_pkgname-$pkgver-linux.tgz)
sha256sums=('88780d5f639920ca04dbb7be2b75f729f5505bc130b21e6fd539e9b33bc0f535')
conflicts=('microw8')
provides=('microw8')

package() {
  cd "$srcdir/microw8-linux/"
  install -Dm755 uw8 "$pkgdir/usr/bin/uw8"
  install -Dm644 README.md "$pkgdir/usr/share/doc/microw8/README.md"
  install -Dm644 microw8.html "$pkgdir/usr/share/doc/microw8/microw8.html"
  install -Dm644 examples/* -t "$pkgdir/usr/share/doc/microw8/examples/"
  install -Dm644 carts/* -t "$pkgdir/usr/share/doc/microw8/carts/"
}
