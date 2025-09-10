# Maintainer: haxibami <contact at haxibami dot net>

pkgname=pipes-rs
pkgver=1.6.4
pkgrel=1
pkgdesc="An over-engineered rewrite of pipes.sh in Rust"
arch=('any')
url="https://github.com/lhvy/pipes-rs"
license=("BlueOak-1.0.0")
makedepends=('cargo')
source=(
  "https://github.com/lhvy/pipes-rs/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('8c2e2b376a571cda6c8c9a38aba068de5c0c89f07417727984524d8c002befc2')
options=('!lto')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
