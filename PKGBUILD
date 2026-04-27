# Maintainer: Nicolas Modrzyk <hellonico@gmail.com>
pkgname=coni-bin
pkgver=2026.04.27.15.52.38
pkgrel=1
pkgdesc="A fast, standalone Clojure-like interpreter and language written in Go"
arch=('x86_64' 'aarch64')
url="https://coni-lang.org"
license=('MIT')
provides=('coni')
conflicts=('coni')

source_x86_64=("https://coni-lang.org/downloads/coni-linux-x64")
source_aarch64=("https://coni-lang.org/downloads/coni-linux-arm64")
sha256sums_x86_64=('d487e4967e03ac3df37301e8953096de0e0b8cfecd8131ff5291ad65d39d2af2')
sha256sums_aarch64=('84689027ad68b7e329128274020e739d887181a999743cd5bb133496d5a5a3b6')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "$srcdir/coni-linux-x64" "$pkgdir/usr/bin/coni"
  elif [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "$srcdir/coni-linux-arm64" "$pkgdir/usr/bin/coni"
  fi
}
