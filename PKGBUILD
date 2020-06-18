# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.14.2
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://dl.bintray.com/tetrate/getenvoy-deb/pool/stable/g/getenvoy-envoy/getenvoy-envoy_1.14.2.p0.g1a0363c-1p66.gfbeeb15_amd64.deb"
)
sha512sums=(
  "ae66060729b9a5dcb142e50be00155924cf4278965d5643deeec83110edf7df71bfdf2a36cb43c7abc3a4f30f230146d21f894f513db5831840da2eb9469b05e"
)

package() {
  tar -xvf $srcdir/data.tar.xz -C "$pkgdir"
  tar -xvf $srcdir/control.tar.gz -C "$pkgdir"
  rm -r $pkgdir/usr/share
  rm -r $pkgdir/control
}
