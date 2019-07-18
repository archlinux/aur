# Maintainer: gxb153 <maintainer at gmail dot com>

pkgname=listen1-desktop-appimage
pkgver=2.4.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="https://listen1.github.io/listen1/"
license=("MIT")
makedepends=("p7zip")
noextract=("Listen1_${pkgver}_linux_x86_64.AppImage")
options=("!strip")
source=("https://github.com/listen1/listen1_desktop/releases/download/v${pkgver}/Listen1_${pkgver}_linux_x86_64.AppImage"
    "https://raw.githubusercontent.com/listen1/listen1_desktop/master/app/resources/logo.png"
    "https://raw.githubusercontent.com/listen1/listen1_desktop/master/app/resources/logo512.png"
    "https://raw.githubusercontent.com/listen1/listen1_desktop/master/app/resources/logo_16.png"
    "https://raw.githubusercontent.com/listen1/listen1_desktop/master/app/resources/logo_32.png")
sha256sums=("cbe4a5aaf0d41b638e2aa4cf3dfd8a3e9ed9d51c01b7709db2fc9cb490707c51"
    "260f6192d50230d1c7eac2e4642670551aa5d1291ed8f9ae422f20cfd762d96d"
    "c9bd5824091a559fc6a28f02e846382eeee01d72b71471a694010a712fa31805"
    "d9d9e162b23d5463347cad0ae81c8482be6d6f31c79c05effbf32b107635f4b8"
    "ae54074610b6af78aab7936ad11a2c2e3f5bcf4ef97c8e033c047176570f5cac")

package() {
    cd "${srcdir}"
    mv "Listen1_${pkgver}_linux_x86_64.AppImage" "listen1.AppImage"
    7z e "${srcdir}/listen1.AppImage" listen1.desktop
    sed -i "s/AppRun/\/opt\/listen1\/listen1.AppImage/" listen1.desktop
    install -Dm755 "listen1.AppImage" "${pkgdir}/opt/listen1/listen1.AppImage"
    install -Dm644 "listen1.desktop" "${pkgdir}/usr/share/applications/listen1.desktop"
    install -Dm644 "logo_16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/listen1.png"
    install -Dm644 "logo_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/listen1.png"
    install -Dm644 "logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/listen1.png"
    install -Dm644 "logo512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/listen1.png"
}
