# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.38.2
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('00ac8dad858f02506aa347b40d610fc8001557816fe42f417afc7fa74032be17a64e42a2307035eb6fe3a334b51e761d0e056555b45c40b283893b91c737a0f7')


check() {
   "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" --version > /dev/null
}

package() {
  install -Dm755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
