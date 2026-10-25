# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.40.1
pkgrel=1
pkgdesc="An open source edge and service proxy, designed for cloud-native applications"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache-2.0')
depends=(glibc)
source=(
  "https://archive.tetratelabs.io/envoy/download/v$pkgver/envoy-v$pkgver-linux-amd64.tar.xz"
)
sha512sums=('c4f2c11ea2459c2c9f59013247ff5eb298bb626920160e035071c319086101b667a168af94ca71459316afbb58a8108a5fc040cfb804df468c4670287a595384')


check() {
   "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" --version > /dev/null
}

package() {
  install -Dm755 "$srcdir/envoy-v$pkgver-linux-amd64/bin/envoy" "$pkgdir/usr/bin/envoy"
}
