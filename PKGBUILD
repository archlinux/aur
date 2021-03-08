# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.17.1
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://dl.bintray.com/tetrate/getenvoy-deb/pool/stable/g/getenvoy-envoy/getenvoy-envoy_1.17.1.p0.gd6a4496-1p74.gbb8060d_amd64.deb"
)
sha512sums=('f8050b831ad64e7869a8004062565230b5474f06709cfef158ce0cec90eecd8cc42bfbcb99397f438bd9dba9f9cd75cdddf1c091f9845b9521d5ca2d56b96a7f')

package() {
  tar -xvf $srcdir/data.tar.xz -C "$pkgdir"
  tar -xvf $srcdir/control.tar.gz -C "$pkgdir"
  rm -r $pkgdir/usr/share
  rm -r $pkgdir/control
}
