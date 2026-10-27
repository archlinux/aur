pkgname=oxmgr-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Lightweight cross-platform process manager"
arch=('x86_64' 'aarch64')
url="https://github.com/Vladimir-Urik/OxMgr"
license=('MIT')
optdepends=('systemd: install and manage the oxmgr daemon as a systemd service')
provides=('oxmgr')
conflicts=('oxmgr')
source_x86_64=(
  "https://github.com/Vladimir-Urik/OxMgr/releases/download/v${pkgver}/oxmgr-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
source_aarch64=(
  "https://github.com/Vladimir-Urik/OxMgr/releases/download/v${pkgver}/oxmgr-v${pkgver}-aarch64-unknown-linux-musl.tar.gz"
)
source=(
  "LICENSE::https://raw.githubusercontent.com/Vladimir-Urik/OxMgr/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  '7eb650b5f79b6396dd13fc61a03a938cbe7e9e6ead51978cf97b07c65227c990'
)
sha256sums_aarch64=(
  'c2bad2878f9b5e84171dbf9fa5a91ec99671fec65e789c484b1e478f1752897c'
)
sha256sums=(
  'aee235df1ebced77a16a1c5b18e341a89f688085001ccaf4932f9b0f48938282'
)

package() {
  install -Dm755 "${srcdir}/oxmgr" "${pkgdir}/usr/bin/oxmgr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
