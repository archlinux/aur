# Maintainer: Nicolas Modrzyk <hellonico@gmail.com>
pkgname=coni-bin
pkgver=2026.04.27.14.37.01
pkgrel=1
pkgdesc="A fast, standalone Clojure-like interpreter and language written in Go"
arch=('x86_64' 'aarch64')
url="https://coni-lang.org"
license=('MIT')
provides=('coni')
conflicts=('coni')

source_x86_64=("https://coni-lang.org/downloads/coni-linux-x64")
source_aarch64=("https://coni-lang.org/downloads/coni-linux-arm64")
sha256sums_x86_64=('2b3b37465647a625dfca194f30f1bf8ac2c0621273ddd28c90d5849ad7e01038')
sha256sums_aarch64=('83b2af1eb996c8259aaae5b82e09befb170baea4a0079af77ceef63b41959ee5')

package() {
  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "$srcdir/coni-linux-x64" "$pkgdir/usr/bin/coni"
  elif [ "$CARCH" = "aarch64" ]; then
    install -Dm755 "$srcdir/coni-linux-arm64" "$pkgdir/usr/bin/coni"
  fi
}
