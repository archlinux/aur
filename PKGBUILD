# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.16.0
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://dl.bintray.com/tetrate/getenvoy-deb/pool/stable/g/getenvoy-envoy/getenvoy-envoy_1.16.0.p0.g8fb3cb8-1p69.ga5345f6_amd64.deb"
)
sha512sums=('42468159c532c0023c831e9bfa78bcd062d969a4fd39813b9c1a57f032340d4e0a3da85cfdd44c727e8de83f143655b4f68c6cf0e8ef8f8dfa618ba043ddb14c')

package() {
  tar -xvf $srcdir/data.tar.xz -C "$pkgdir"
  tar -xvf $srcdir/control.tar.gz -C "$pkgdir"
  rm -r $pkgdir/usr/share
  rm -r $pkgdir/control
}
