# Maintainer: Frezzydy <frezzydygaming@gmail.com>

pkgname=vimcord-git
pkgver=0.7.2
pkgrel=1
pkgdesc="A Terminal UI Discord Client in Rust (latest)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/vimcord"

license=('MIT')
depends=('cargo')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "vimcord-main"

  cargo build --release
}

package() {
  cd "vimcord-main"

  install -Dm755 "target/release/vimcord" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
