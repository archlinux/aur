# Contributor: Scott Alfter <scott@alfter.us>

pkgname=clog
pkgver=0.6.4
pkgrel=1
pkgdesc="High-Visibility Caddy Log Viewer"
arch=(any)
url=https://github.com/hellotimking/clog
license=("MIT")
depends=("go")
makedepends=("go")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/hellotimking/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
  "07199d9d3ff37228822d29b84579c1fecb97a9001fcc8ca99bac15920f7cef3fd6375091352364cb0dd7823a40b8ed366d70de314fd7b2ed938df41112b7749d"
)

build() {
  cd ${pkgname}-${pkgver}
  go build -ldflags="-s -w" -o clog
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  cp clog ${pkgdir}/usr/bin
}
