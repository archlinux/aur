# Contributor: Scott Alfter <scott@alfter.us>

pkgname=caddy-analyzer
pkgver=0.7.3
pkgrel=1
pkgdesc="Fast, zero-dependency access log analyzer, security threat inspector, and TUI dashboard for Caddy v2"
arch=(any)
url=https://github.com/lenny-ts/caddy-analyzer
license=("MIT")
depends=("go")
makedepends=("go")
source=( "${pkgname}-${pkgver}.tar.gz::https://github.com/lenny-ts/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" )
sha512sums=( "9cd2b1654a85e0a8e1710fefb19cfb31d35bbaac6e46dc3c5eacc62fee899708c201cf587939214a01250412a2274afec4440f7dc0176307c0fac2ded908cd37" )

build() {
  cd ${pkgname}-${pkgver}
  go build ./cmd/caddy-analyze
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  cp caddy-analyze ${pkgdir}/usr/bin
}


