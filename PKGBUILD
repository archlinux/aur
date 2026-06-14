# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-bin
_pkgver=2.2.4
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobehub"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=()
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
conflicts=('lobehub-desktop' 'lobe-chat-appimage')
provides=('lobehub-desktop')

source=("lobehub-desktop-2.2.4.x86_64.rpm::https://github.com/lobehub/lobehub/releases/download/v${_pkgver}/lobehub-desktop-2.2.4.x86_64.rpm"
  "LICENSE::https://raw.githubusercontent.com/lobehub/lobehub/main/LICENSE"
  "lobehub-desktop.png::https://raw.githubusercontent.com/lobehub/lobehub/main/apps/desktop/resources/tray.png")
sha256sums=('07d63c58d1cfadf1288fe0535e2eb85eae12a1f5e9e8f2062bdc5a6a8a5723e6'
  '790a8c42f10beb4f5e9122e05a8e65d5522de49f89ac69cd31063c0f2be93ea4'
  '38e5a907edee6a2188c7f49d6c56688c8c7e110a0dc2ccd6172129372f21efaf')

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/lobehub-desktop-2.2.4.x86_64.rpm"

  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 lobehub-desktop.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lobehub-desktop.png"

  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/LobeHub/lobehub-desktop "${pkgdir}/usr/bin/lobehub-desktop"
}
