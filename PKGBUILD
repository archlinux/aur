pkgname=oxmgr-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight cross-platform process manager"
arch=('x86_64' 'aarch64')
url="https://github.com/Vladimir-Urik/OxMgr"
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('systemd: install and manage the oxmgr daemon as a systemd service')
provides=('oxmgr')
conflicts=('oxmgr')
source_x86_64=(
  "https://github.com/Vladimir-Urik/OxMgr/releases/download/v${pkgver}/oxmgr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
  "https://github.com/Vladimir-Urik/OxMgr/releases/download/v${pkgver}/oxmgr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
source=(
  "LICENSE::https://raw.githubusercontent.com/Vladimir-Urik/OxMgr/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  '043fd2f1d3e273451b008e6e38fd8b031ca60e2053b196f43bda49d38b2798d1'
)
sha256sums_aarch64=(
  '46842152a23ccf4eb428e0b5c91435622935b3b578eed14c07eb3f84fdf3208b'
)
sha256sums=(
  'aee235df1ebced77a16a1c5b18e341a89f688085001ccaf4932f9b0f48938282'
)

package() {
  install -Dm755 "${srcdir}/oxmgr" "${pkgdir}/usr/bin/oxmgr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
