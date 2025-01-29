# Maintainer: Stian HJ <stianhj@gmail.com>

pkgname=microw8-bin
_pkgname=microw8
pkgver=0.4.0
pkgrel=1
pkgdesc="WebAssembly based fantasy console"
arch=('x86_64')
url="https://exoticorn.github.io/microw8/"
license=('Unlicense')
source=(https://github.com/exoticorn/microw8/releases/download/v$pkgver/$_pkgname-$pkgver-linux.tgz)
sha256sums=('7f50429ed6b8b6e915c7e500b1d82fb0f5c7b5312dfa8bbdf82208ea192ee388')
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
