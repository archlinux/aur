# Maintainer: Bwc9876 <bwc9876@gmail.com>
pkgname=owmods-gui-bin
_appname=outer-wilds-mod-manager
pkgver=0.14.2
pkgrel=1
pkgdesc="A GUI To Manage Outer Wilds Mods"
arch=('x86_64')
url="https://github.com/ow-mods/ow-mod-man/tree/main/owmods_gui"
license=('GPL3')
depends=('glibc' 'gtk3' 'openssl' 'hicolor-icon-theme' 'glib2' 'gcc-libs' 'gdk-pixbuf2' 'webkit2gtk' 'cairo' 'mono')
source=("${_appname}-${pkgver}-${arch}.deb::https://github.com/ow-mods/ow-mod-man/releases/download/gui_v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('f6c2791351bb922e03407739981e950d50329e067acecb6a6e18e9705d9362b4')

package() {
    tar xpf data.tar.gz -C ${srcdir}
    install -Dm755 usr/bin/${_appname} ${pkgdir}/usr/bin/${_appname}
    sed -i "s/Exec=outer-wilds-mod-manager/Exec=outer-wilds-mod-manager %u/g" usr/share/applications/${_appname}.desktop
    install -Dm755 usr/share/applications/${_appname}.desktop ${pkgdir}/usr/share/applications/${_appname}.desktop

    install -Dm644 "usr/share/icons/hicolor/128x128/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/${_appname}.png"
    install -Dm644 "usr/share/icons/hicolor/32x32/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_appname}.png"
}
