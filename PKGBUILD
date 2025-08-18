# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.35.0
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('605a7d1d29d7e5c6da50649869ab74fd3800208a1b47b78daedf38aac499b89996d7cdafc143f52b36067bce8c2fde03a929ce2a9054163a21a77c29ecd178b8')


check() {
   "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" --version > /dev/null
}

package() {
  install -Dm755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
