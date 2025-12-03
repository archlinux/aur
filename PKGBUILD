# Maintainer: Frezzydy <frezzydygaming@gmail.com>

reponame=Rivet
pkgname=rivetui
pkgver=0.2.1
pkgrel=1
pkgdesc="A Terminal UI Discord Client in Rust"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/YetAnotherMechanicusEnjoyer/Rivet"

license=('MIT')
depends=('glibc' 'cargo' 'rust')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${reponame}-${pkgver}"

  cargo build --release
}

package() {
  cd "${reponame}-${pkgver}"

  install -Dm755 "target/release/rivetui" "${pkgdir}/usr/bin/rivetui"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
