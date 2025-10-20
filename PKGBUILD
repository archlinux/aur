# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.139.2
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=()
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source=("lobehub-desktop-beta-1.139.2.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.139.2.x86_64.rpm"
  "LICENSE::https://raw.githubusercontent.com/lobehub/lobe-chat/main/LICENSE"
  "lobehub-desktop-beta.png::https://raw.githubusercontent.com/lobehub/lobe-chat/main/apps/desktop/resources/tray.png")
sha256sums=('268fa4b865a2c11f068949e30c397a1e6bb7436a563bed9849b9b27bad929390'
  '790a8c42f10beb4f5e9122e05a8e65d5522de49f89ac69cd31063c0f2be93ea4'
  '38e5a907edee6a2188c7f49d6c56688c8c7e110a0dc2ccd6172129372f21efaf')

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/lobehub-desktop-beta-1.139.2.x86_64.rpm"

  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 lobehub-desktop-beta.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lobehub-desktop-beta.png"

  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/LobeHub-Beta/lobehub-desktop-beta "${pkgdir}/usr/bin/lobehub-desktop-beta"
}
