# Contributor: Scott Alfter <scott@alfter.us>

pkgname=caddy-analyzer
pkgver=0.7.2
pkgrel=1
pkgdesc="Fast, zero-dependency access log analyzer, security threat inspector, and TUI dashboard for Caddy v2"
arch=(any)
url=https://github.com/lenny-ts/caddy-analyzer
license=("MIT")
depends=("go")
makedepends=("go")
source=( "${pkgname}-${pkgver}.tar.gz::https://github.com/lenny-ts/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" )
sha512sums=( "3e1fa322de64c46da285d1b8ad96a40c39f990a27bfd99465c4051cae35a7b6dadb117f22a042609ed0f8e1d257d9c9cc2850ca6c0972f75e79efbd56da20d4c" )

build() {
  cd ${pkgname}-${pkgver}
  go build ./cmd/caddy-analyze
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  cp caddy-analyze ${pkgdir}/usr/bin
}


