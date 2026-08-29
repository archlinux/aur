# Contributor: Scott Alfter <scott@alfter.us>

pkgname=caddy-analyzer
pkgver=0.5.1
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
  "efd8ef2bd9524d7ddb11f4a48615963ec0533e9ec607a1d678b2558c6677b306e02c7d74963fc7bbf6b1415d633e5ffb812ad9d71a428255ef467b1daff5945e"
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

