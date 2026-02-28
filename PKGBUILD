pkgname=obsidian-cli-inspector
pkgver=0.1.0
pkgrel=1
pkgdesc="Local-first CLI/TUI for indexing and querying Obsidian vaults"
arch=('x86_64')
url="https://github.com/jingyi-zhao-01/obsidian-cli-inspector"
license=('Apache')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jingyi-zhao-01/obsidian-cli-inspector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('REPLACE_ME')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
