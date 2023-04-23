# Maintainer: atomicfs

pkgname=mdbook-admonish
pkgver=1.9.0
pkgrel=1
pkgdesc="A preprocessor for mdbook to add Material Design admonishments"
url="https://github.com/tommilligan/mdbook-admonish"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('98dfe8f9375b8a1763a74051000459c55f4c95f7b25fc6f3a3a357bba05c9835')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

