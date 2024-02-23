# Maintainer: haxibami <contact at haxibami dot net>

pkgname=pipes-rs
pkgver=1.6.3
pkgrel=1
pkgdesc="An over-engineered rewrite of pipes.sh in Rust"
arch=('any')
url="https://github.com/lhvy/pipes-rs"
license=("BlueOak-1.0.0")
makedepends=('cargo')
source=(
  "https://github.com/lhvy/pipes-rs/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('ac7452f5b29e83bea6da14d37cf37efcf0a7c90846001cab55c4c1aea500d6cb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
