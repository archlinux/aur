# Maintainer: Bwc9876 <bwc9876@gmail.com>
pkgname=owmods-gui-bin
_appname=outer-wilds-mod-manager
pkgver=0.13.0
pkgrel=1
pkgdesc="A GUI To Manage Outer Wilds Mods"
arch=('x86_64')
url="https://github.com/ow-mods/ow-mod-man/tree/main/owmods_gui"
license=('GPL3')
depends=('glibc' 'gtk3' 'openssl-1.1' 'hicolor-icon-theme' 'glib2' 'gcc-libs' 'gdk-pixbuf2' 'webkit2gtk' 'cairo' 'mono')
source=("${_appname}-${pkgver}-${arch}.deb::https://github.com/ow-mods/ow-mod-man/releases/download/gui_v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('a48d0a38fce4e9270934e706c3cd74aa6a43c6d2f2c509eec530b706c20143f4')

package() {
    tar xpf data.tar.gz -C ${srcdir}
    install -Dm755 usr/bin/${_appname} ${pkgdir}/usr/bin/${_appname}
    sed -i "s/Exec=outer-wilds-mod-manager/Exec=outer-wilds-mod-manager %u/g" usr/share/applications/${_appname}.desktop
    install -Dm755 usr/share/applications/${_appname}.desktop ${pkgdir}/usr/share/applications/${_appname}.desktop

    install -Dm644 "usr/share/icons/hicolor/128x128/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/${_appname}.png"
    install -Dm644 "usr/share/icons/hicolor/32x32/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_appname}.png"
}
