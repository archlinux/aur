# Contributor: Scott Alfter <scott@alfter.us>

pkgname=caddy-analyzer
pkgver=0.7.4
pkgrel=1
pkgdesc="Fast, zero-dependency access log analyzer, security threat inspector, and TUI dashboard for Caddy v2"
arch=(any)
url=https://github.com/lenny-ts/caddy-analyzer
license=("MIT")
depends=("go")
makedepends=("go")
source=( "${pkgname}-${pkgver}.tar.gz::https://github.com/lenny-ts/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" )
sha512sums=( "8d5180a90b6a6023fd2edb4147ab80081d81c7d93a1ed0dd4211072838b87341a24bea17c55cd1b07e898eed72bca8a677ce8e976c4328de919db8769266f189" )

build() {
  cd ${pkgname}-${pkgver}
  go build ./cmd/caddy-analyze
}

package() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin
  cp caddy-analyze ${pkgdir}/usr/bin
}


