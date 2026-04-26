pkgname=oxmgr-bin
pkgver=0.4.0
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
  '9656d444ca1c75927d8072e388c5f4e147fcd989cd15bf6f6bcf15f0c630fb48'
)
sha256sums_aarch64=(
  '977aa12a3b1fdb66a7fc51f2ae4494f0cb66027fa05f580b6f2633ccf9b562a1'
)
sha256sums=(
  'aee235df1ebced77a16a1c5b18e341a89f688085001ccaf4932f9b0f48938282'
)

package() {
  install -Dm755 "${srcdir}/oxmgr" "${pkgdir}/usr/bin/oxmgr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
