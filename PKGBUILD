# Maintainer: Frezzydy <frezzydygaming@gmail.com>

pkgname=vimcord
pkgver=0.3.1
pkgrel=1
pkgdesc="A Terminal UI Discord Client in Rust (latest)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/vimcord"

license=('MIT')
depends=('cargo')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-main"

  cargo build --release
}

package() {
  cd "${pkgname}-main"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-git"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}-git/LICENSE"
}
