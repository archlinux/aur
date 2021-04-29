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
    mkdir "${pkgdir}/usr/lib"
    install -Dm755 "squashfs-root/libEGL.so" "${pkgdir}/usr/lib/libEGL.so"
    install -Dm755 "squashfs-root/libffmpeg.so" "${pkgdir}/usr/lib/libffmpeg.so"
    install -Dm755 "squashfs-root/libGLESv2.so" "${pkgdir}/usr/lib/libGLESv2.so"
    install -Dm755 "squashfs-root/libvk_swiftshader.so" "${pkgdir}/usr/lib/libvk_swiftshader.so"
    install -Dm755 "squashfs-root/libvulkan.so.1" "${pkgdir}/usr/lib/libvulkan.so.1"
    install -Dm755 "squashfs-root/raxmlgui" "${pkgdir}/usr/bin/raxmlgui"
    install -Dm644 ~/.cache/yay/raxmlgui/raxmlgui.desktop "${pkgdir}/usr/share/applications/raxmlGUI.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
