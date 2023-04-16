# Maintainer: Bwc9876 <bwc9876@gmail.com>
pkgname=owmods-gui-bin
_appname=ow-mod-manager
pkgver=0.2.1
pkgrel=1
pkgdesc="A GUI To Manage Outer Wilds Mods"
arch=('x86_64')
url="https://github.com/Bwc9876/ow-mod-man/owmods_gui"
license=('GPL3')
depends=('glibc' 'gtk3' 'openssl-1.1' 'hicolor-icon-theme' 'glib2' 'gcc-libs' 'gdk-pixbuf2' 'webkit2gtk' 'cairo')
source=("${_appname}-${pkgver}-${arch}.deb::https://github.com/Bwc9876/ow-mod-man/releases/download/gui_v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('2ade350c35b78dfe7af73f51b7e22ddfb2a488be1dd00b8f8203df68759ada7c')

package() {
    tar xpf data.tar.gz -C ${srcdir}/data
    cd ${srcdir}
    install -Dm755 data/usr/bin/ow-mod-manager ${pkgdir}/usr/bin/ow-mod-manager
    install -Dm755 data/usr/share/applications/ow-mod-manager.desktop ${pkgdir}/usr/share/applications/ow-mod-manager.desktop

    install -Dm644 "data/usr/share/icons/hicolor/128x128/apps/ow-mod-manager.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ow-mod-manager.png"
    install -Dm644 "data/usr/share/icons/hicolor/256x256@2/apps/ow-mod-manager.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/ow-mod-manager.png"
    install -Dm644 "data/usr/share/icons/hicolor/32x32/apps/ow-mod-manager.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/ow-mod-manager.png"
}
