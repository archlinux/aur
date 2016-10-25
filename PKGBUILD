# Maintainer: John Trengrove <john@retrofilter.com>

pkgname=dgraph-bin
_pkgname=dgraph
pkgver=0.4.4
pkgrel=1
pkgdesc='a low latency, high throughput, native and distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE')
depends=('gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
sha256sums=('a3ae2915edcab7f2fac83d7d9205304c5d9318b36808493b57a4e87182b3c7c9')

package() {
  cd "$srcdir"
  for binary in dgraph dgraphassigner dgraphlist dgraphloader dgraphmerge; do
    install -Dm755 $binary "$pkgdir/usr/bin/$binary"
  done
}

# vim:set ts=2 sw=2 et:
