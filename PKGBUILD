# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.39.0
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('a0140926709f0a4e318ab9eadac5658962d03ada4cc23535668a8336c96d6bdeb4dd8be9e0eddc2b64a6d595ecc712b4ce30723ea3b803e04f0acb4a1baa327f')


check() {
   "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" --version > /dev/null
}

package() {
  install -Dm755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
