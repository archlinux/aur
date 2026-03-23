# Maintainer: Nicolas Modrzyk <hellonico@gmail.com>
pkgname=coni-bin
pkgver=2026.03.23.20.42.22
pkgrel=1
pkgdesc="A fast, standalone Clojure-like interpreter and language written in Go"
arch=('x86_64' 'aarch64')
url="https://coni-lang.org"
license=('MIT')
provides=('coni')
conflicts=('coni')

source_x86_64=("https://coni-lang.org/downloads/coni-linux-x64")
source_aarch64=("https://coni-lang.org/downloads/coni-linux-arm64")
sha256sums_x86_64=('1a326655fb806873ed99c213adb94d4dc060f497e0d6b41c2e65b36b1047649f')
sha256sums_aarch64=('d612dfa529ac1474a0316ab870b6edcb6c8d602cd947b3a49872b9782d3645ba')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "$srcdir/coni-linux-x64" "$pkgdir/usr/bin/coni"
  elif [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "$srcdir/coni-linux-arm64" "$pkgdir/usr/bin/coni"
  fi
}
