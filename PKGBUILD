pkgname=oxmgr-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Lightweight cross-platform process manager"
arch=('x86_64')
url="https://github.com/Vladimir-Urik/OxMgr"
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('systemd: install and manage the oxmgr daemon as a systemd service')
provides=('oxmgr')
conflicts=('oxmgr')
source=(
  "https://github.com/Vladimir-Urik/OxMgr/releases/download/v${pkgver}/oxmgr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/Vladimir-Urik/OxMgr/v${pkgver}/LICENSE"
)
sha256sums=(
  'ef54c661f738a9030c3b8b982b18dd6e869e91a3348f6a205230bf93f6511c17'
  'aee235df1ebced77a16a1c5b18e341a89f688085001ccaf4932f9b0f48938282'
)

package() {
  install -Dm755 "${srcdir}/oxmgr" "${pkgdir}/usr/bin/oxmgr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
