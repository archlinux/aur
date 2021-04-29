# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=raxmlgui
pkgver=2.0.3
pkgrel=1
pkgdesc="A new user-friendly program integrating RAxML-NG and ModelTest-NG for cutting-edge phylogenetic analysis"
arch=('x86_64')
url="https://antonellilab.github.io/raxmlGUI"
license=('AGPL3')
source=("https://github.com/AntonelliLab/raxmlGUI/releases/download/v2.0.3/raxmlGUI-2.0.3.AppImage")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"
  chmod +x raxmlGUI-${pkgver}.AppImage
  ./raxmlGUI-${pkgver}.AppImage --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 "squashfs-root/raxmlgui" "${pkgdir}/usr/bin/raxmlgui"
    install -Dm644 ~/.cache/yay/raxmlgui/raxmlgui.desktop "${pkgdir}/usr/share/applications/raxmlGUI.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
