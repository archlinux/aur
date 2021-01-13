# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.17.0
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://dl.bintray.com/tetrate/getenvoy-deb/pool/stable/g/getenvoy-envoy/getenvoy-envoy_1.17.0.p0.g5c801b2-1p72.g28ef262_amd64.deb"
)
sha512sums=('9a4d25345c1e96f84d5e5a112d6aaa099b13a1ac514f7e33e085c757509e9c0036bc8305c51fa2db83744940a2ab76344d5098215bfeba197db0c63b57db5bb6')

package() {
  tar -xvf $srcdir/data.tar.xz -C "$pkgdir"
  tar -xvf $srcdir/control.tar.gz -C "$pkgdir"
  rm -r $pkgdir/usr/share
  rm -r $pkgdir/control
}
