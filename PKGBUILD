# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>
pkgname=envoyproxy-bin
provides=(envoyproxy)
conflicts=(envoyproxy)
pkgver=1.18.3
pkgrel=1
pkgdesc="A high performance, open source, general RPC framework that puts mobile and HTTP/2 first"
arch=('x86_64')
url="https://envoyproxy.io"
license=('Apache2')
source=(
  "https://dl.bintray.com/tetrate/getenvoy-deb/pool/stable/g/getenvoy-envoy/getenvoy-envoy_1.18.3.p0.g98c1c9e-1p77.gb76c773_amd64.deb"
)
sha512sums=('34174fa9af7bc2dc5909aaec866d164dd5b6eaa1ce5eda1675bea31bd8dd62147f2339263f7bef8ac08e23c210420b4e1c734683a9863e433931ba25e0d687e0')

package() {
  tar -xvf $srcdir/data.tar.xz -C "$pkgdir"
  tar -xvf $srcdir/control.tar.gz -C "$pkgdir"
  rm -r $pkgdir/usr/share
  rm -r $pkgdir/control
}
