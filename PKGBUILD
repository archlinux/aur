# Maintainer: Frezzydy <frezzydygaming@gmail.com>

pkgname=vimcord
pkgver=0.7.2
pkgrel=1
pkgdesc="A Terminal UI Discord Client in Rust"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/vimcord"

license=('MIT')
depends=('cargo')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
