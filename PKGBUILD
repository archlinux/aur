# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-next-bin
_pkgver=2.0.0-next.226
pkgver=2.0.0_next.226
pkgrel=1
pkgdesc="Desktop version of lobe-chat (v2.0.0-Next)."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
conflicts=('lobehub-desktop' 'lobehub-desktop-beta-bin' 'lobe-chat-appimage')
provides=('lobehub-desktop')

source=("lobehub-desktop-next-bin-${pkgver}.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-2.0.0-next.226.x86_64.rpm"
  "LICENSE::https://raw.githubusercontent.com/lobehub/lobe-chat/main/LICENSE"
  "lobehub-desktop-beta.png::https://raw.githubusercontent.com/lobehub/lobe-chat/main/apps/desktop/resources/tray.png")
sha256sums=('ed209c70c4ba0e8c651e81a14cfedffb9fa382ac7c3e3ae3421f480f8e147c41'
  '790a8c42f10beb4f5e9122e05a8e65d5522de49f89ac69cd31063c0f2be93ea4'
  '38e5a907edee6a2188c7f49d6c56688c8c7e110a0dc2ccd6172129372f21efaf')

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/lobehub-desktop-next-bin-${pkgver}.rpm"

  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 lobehub-desktop-beta.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lobehub-desktop-beta.png"

  install -d "${pkgdir}/usr/bin"
  
  ln -sf "${_opt_dir}/lobehub-desktop-beta" "${pkgdir}/usr/bin/lobehub-desktop-beta"
}
