# Contributor: Scott Alfter <scott@alfter.us>

pkgname=caddy-analyzer
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast, zero-dependency access log analyzer, security threat inspector, and TUI dashboard for Caddy v2"
arch=(any)
url=https://github.com/lenny-ts/caddy-analyzer
license=("MIT")
depends=("go")
makedepends=("go")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/lenny-ts/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
  "7d51d851ab446b165ffee638c8e4f1f79b7fec49bdbbb4e71eebf05f0a1f056be4cc41a55be6c7bca84adde9af9485442fdf58fcf62127da5312b2055f0c3f00"
)

build() {
  cd ${pkgname}-${pkgver}
  go build ./cmd/caddy-analyze
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  cp caddy-analyze ${pkgdir}/usr/bin
}
