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
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/appimages/raxmlGUI.AppImage"
  install -dm755 "${pkgdir}/usr/share/"
  mkdir "${pkgdir}/usr/share/applications/" 
  cp "${srcdir}/squashfs-root/raxmlgui.desktop" "${pkgdir}/usr/share/applications/" 
}
