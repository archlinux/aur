pkgname=oxmgr-bin
pkgver=0.3.0
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
  'bac88d7b0bcd1ef455aeba4473513973ae3edb1884a22a3b9f4c87327187cce9'
)
sha256sums_aarch64=(
  '3394e99ed84c6ff035adaae22d1fb19e5394126fe55746937e6ca3da8a291a7f'
)
sha256sums=(
  'aee235df1ebced77a16a1c5b18e341a89f688085001ccaf4932f9b0f48938282'
)

package() {
  install -Dm755 "${srcdir}/oxmgr" "${pkgdir}/usr/bin/oxmgr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
