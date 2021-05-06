# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=raxmlgui
pkgver=2.0.4
pkgrel=1
pkgdesc="A new user-friendly program integrating RAxML-NG and ModelTest-NG for cutting-edge phylogenetic analysis"
arch=('x86_64')
url="https://antonellilab.github.io/raxmlGUI"
license=('AGPL3')
source=("https://github.com/AntonelliLab/raxmlGUI/releases/download/v${pkgver}/raxmlGUI-${pkgver}.AppImage" "raxmlgui.desktop")
sha256sums=('096cb81e8015281e8311f68fce1a730d7b16ba42b78f8aeec2ba840610baf40f'
            '0925bc8e4ae1d0fb7fbe5a5605cda7c044d8f8bda99b556dd54bd55ba7b3b0c5')

prepare() {
  cd "${srcdir}"
  chmod +x raxmlGUI-${pkgver}.AppImage
  ./raxmlGUI-${pkgver}.AppImage --appimage-extract
}

package() {
    
    mkdir "${pkgdir}/usr/"
    mkdir "${pkgdir}/usr/share/"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/raxmlgui/"
    mkdir "${pkgdir}/usr/share/raxmlgui/swiftshader/"
    mkdir "${pkgdir}/usr/share/raxmlgui/usr/"
    mkdir "${pkgdir}/usr/share/raxmlgui/usr/lib/"
    mkdir "${pkgdir}/usr/share/raxmlgui/resources"
    mkdir "${pkgdir}/usr/share/raxmlgui/resources/static"
    mkdir "${pkgdir}/usr/share/raxmlgui/resources/static/bin"
    mkdir "${pkgdir}/usr/share/raxmlgui/locales/"
    
    install -dm755 "${pkgdir}/usr/share/icons"
    install -D -m 755 ${srcdir}/squashfs-root/*.so "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.pak "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.bin "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.dat "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.json "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.so.1 "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.png "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.html "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.desktop "${pkgdir}/usr/share/raxmlgui/"
    install -D -m 755 ${srcdir}/squashfs-root/*.txt "${pkgdir}/usr/share/raxmlgui/"
    install -Dm755 "${srcdir}/squashfs-root/AppRun" "${pkgdir}/usr/share/raxmlgui/AppRun"
    install -Dm755 "${srcdir}/squashfs-root/raxmlgui" "${pkgdir}/usr/share/raxmlgui/raxmlgui"
    install -Dm755 "${srcdir}/squashfs-root/chrome-sandbox" "${pkgdir}/usr/share/raxmlgui/chrome-sandbox"
    
    install -D -m 755 ${srcdir}/squashfs-root/locales/*.pak "${pkgdir}/usr/share/raxmlgui/locales/"
    
    install -D -m 755 ${srcdir}/squashfs-root/swiftshader/*.so "${pkgdir}/usr/share/raxmlgui/swiftshader/"
    
    install -D -m 755 ${srcdir}/squashfs-root/usr/lib/*.so.1 "${pkgdir}/usr/share/raxmlgui/usr/lib/"
    install -D -m 755 ${srcdir}/squashfs-root/usr/lib/*.so.4 "${pkgdir}/usr/share/raxmlgui/usr/lib/"
    install -D -m 755 ${srcdir}/squashfs-root/usr/lib/*.so.6 "${pkgdir}/usr/share/raxmlgui/usr/lib/"
    install -D -m 755 ${srcdir}/squashfs-root/usr/lib/*.so.7 "${pkgdir}/usr/share/raxmlgui/usr/lib/"
    
    install -Dm755 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/usr/share/raxmlgui/resources/app.asar"
    install -Dm755 "${srcdir}/squashfs-root/resources/app-update.yml" "${pkgdir}/usr/share/raxmlgui/resources/app-update.yml"
    
    install -Dm755 "${srcdir}/squashfs-root/resources/app-update.yml" "${pkgdir}/usr/share/raxmlgui/resources/app-update.yml"
    
    install -D -m 755 ${srcdir}/squashfs-root/resources/static/bin/* "${pkgdir}/usr/share/raxmlgui/resources/static/bin"
    
    install -D -m 755 ${srcdir}/raxmlgui.desktop ${pkgdir}/usr/share/applications/raxmlgui.desktop
}
