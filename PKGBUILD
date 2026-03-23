# Maintainer: Nicolas Modrzyk <hellonico@gmail.com>
pkgname=coni-bin
pkgver=2026.03.23.23.15.24
pkgrel=1
pkgdesc="A fast, standalone Clojure-like interpreter and language written in Go"
arch=('x86_64' 'aarch64')
url="https://coni-lang.org"
license=('MIT')
provides=('coni')
conflicts=('coni')

source_x86_64=("https://coni-lang.org/downloads/coni-linux-x64")
source_aarch64=("https://coni-lang.org/downloads/coni-linux-arm64")
sha256sums_x86_64=('42431724c11b53e984f37894b3b40ad3d041a2e187160c914e462a1555c0bc85')
sha256sums_aarch64=('31cb251874394b357910d75f8ff19f27a9a0ae311f0396edb2f2a11666c24af0')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "$srcdir/coni-linux-x64" "$pkgdir/usr/bin/coni"
  elif [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "$srcdir/coni-linux-arm64" "$pkgdir/usr/bin/coni"
  fi
}
