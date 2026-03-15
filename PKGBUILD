pkgname=oxmgr-bin
pkgver=0.1.8
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
  '33918f1280098c744272c4f2e6f562eb0f44dab5785e724f8b9c9ef72541009c'
)
sha256sums_aarch64=(
  '4e072a51f04cf0250b167b06901a03bb564f68e7e2e09e4281537354d58a93ff'
)
sha256sums=(
  'aee235df1ebced77a16a1c5b18e341a89f688085001ccaf4932f9b0f48938282'
)

package() {
  install -Dm755 "${srcdir}/oxmgr" "${pkgdir}/usr/bin/oxmgr"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
