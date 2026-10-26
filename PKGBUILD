# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=markitdown-gui-appimage
pkgver=1.6.0
pkgrel=1
pkgdesc="Desktop GUI for MarkItDown with queue-based multi-file conversion to Markdown (AppImage)"
url="https://github.com/imadreamerboy/markitdown-gui"
arch=("x86_64")
depends=("fuse2")
provides=("markitdown-gui")
conflicts=("markitdown-gui")
options=("!strip")
license=("MIT")

source=("markitdown-gui-appimage-${pkgver}.AppImage::${url}/releases/download/v.${pkgver}/MarkItDown-Linux-${pkgver}.AppImage" "markitdown-gui.png::https://raw.githubusercontent.com/imadreamerboy/markitdown-gui/main/markitdowngui/resources/markitdown-gui.png" "markitdown-gui.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/markitdown-gui/markitdown-gui.desktop")
sha256sums=('1210ffc02df6ac6fb93f7d67db78ff48a6ba5c817ce998f5fdf24cae4afb74e3'
            '96a468a765aeffc2e65d43aabbd5edd52bbe053c70ec89b3f47bcf70eba843a2'
            'f72153d735a2f38258edbadcc55a02f818ecd63dd2c6a2f0d04383ecb9813144')

prepare() {
  chmod +x "${srcdir}/markitdown-gui-appimage-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/markitdown-gui-appimage-${pkgver}.AppImage" "${pkgdir}/opt/markitdown-gui-appimage/markitdown-gui.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/markitdown-gui-appimage/markitdown-gui.AppImage" "${pkgdir}/usr/bin/markitdown-gui"
  install -Dm644 "${srcdir}/markitdown-gui.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/markitdown-gui.png"
  install -Dm644 "${srcdir}/markitdown-gui.desktop" "${pkgdir}/usr/share/applications/markitdown-gui.desktop"
}

