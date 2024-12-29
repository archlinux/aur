# Maintainer: Bwc9876 <bwc9876@gmail.com>
pkgname=owmods-gui-bin
_appname=owmods_gui
pkgver=0.15.0
pkgrel=1
pkgdesc="A GUI To Manage Outer Wilds Mods"
arch=('x86_64')
url="https://github.com/ow-mods/ow-mod-man/tree/main/owmods_gui"
license=('GPL3')
depends=('mono' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source=("${_appname}-${pkgver}-${arch}.deb::https://github.com/ow-mods/ow-mod-man/releases/download/gui_v${pkgver}/Outer.Wilds.Mod.Manager_${pkgver}_amd64.deb")
sha256sums=('02a36a19c4542689a66878177e70df284aa1d9fc82fcd55fa449fad508ace45a')

package() {
    tar xpf data.tar.gz -C "${srcdir}"
    install -Dm755 "usr/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm755 "usr/share/applications/Outer Wilds Mod Manager.desktop" "${pkgdir}/usr/share/applications/Outer Wilds Mod Manager.desktop"

    install -Dm644 "usr/share/icons/hicolor/128x128/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_appname}.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/${_appname}.png"
    install -Dm644 "usr/share/icons/hicolor/32x32/apps/${_appname}.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_appname}.png"
}
