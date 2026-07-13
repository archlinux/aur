# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.38.3
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('bfbdfa6ea20635fbf1961acd9f92d25651f81f51d90c2fac2311e0800fbc0c2d54e4bafcac8ab0da385d5f07a040b703e0366fbd371f1cc7e50c28f8c8a5cd94')


check() {
   "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" --version > /dev/null
}

package() {
  install -Dm755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
