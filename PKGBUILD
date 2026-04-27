# Maintainer: Nicolas Modrzyk <hellonico@gmail.com>
pkgname=coni-bin
pkgver=2026.04.27.14.47.24
pkgrel=1
pkgdesc="A fast, standalone Clojure-like interpreter and language written in Go"
arch=('x86_64' 'aarch64')
url="https://coni-lang.org"
license=('MIT')
provides=('coni')
conflicts=('coni')

source_x86_64=("https://coni-lang.org/downloads/coni-linux-x64")
source_aarch64=("https://coni-lang.org/downloads/coni-linux-arm64")
sha256sums_x86_64=('330b2cee35e95b0d48a6b78e87af7eb75e61ecf1ccb870f397c244e1a654e814')
sha256sums_aarch64=('f1e2a074ec218c4c3995e2ef73bf3b420dd58a9a52a52169cf713515694c695c')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "$srcdir/coni-linux-x64" "$pkgdir/usr/bin/coni"
  elif [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "$srcdir/coni-linux-arm64" "$pkgdir/usr/bin/coni"
  fi
}
