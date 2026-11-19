# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=vykar-gui-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Desktop GUI for Vykar backup — Slint-based, with system tray and scheduled backups"
arch=('x86_64' 'aarch64')
options=('!debug')
install="${pkgname}.install"
url="https://github.com/borgbase/vykar"
license=('GPL-3.0-only')
depends=('fontconfig' 'libxkbcommon' 'libgl' 'xdotool')
provides=('vykar-gui')
conflicts=('vykar-gui')
source_x86_64=("vykar-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/borgbase/vykar/releases/download/v${pkgver}/vykar-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('dd61cf26975f8c420e50ad59d1e1a4d388b3b0cf602663915eeb940277d3d10d')
source_aarch64=("vykar-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/borgbase/vykar/releases/download/v${pkgver}/vykar-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('984c05fb5a251b5de792249ce72891ff76534849d1325d2d445c27b2c7f7b7f3')

package() {
    cd "$srcdir"
    install -Dm755 vykar-gui "$pkgdir/usr/bin/vykar-gui"

    # .desktop файл чтобы GUI появился в меню приложений
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/vykar-gui.desktop" <<EOF
[Desktop Entry]
Name=Vykar Backup
Comment=Desktop GUI for Vykar backup
Exec=vykar-gui
Icon=utilities-file-archiver
Terminal=false
Type=Application
Categories=Utility;Archiving;
EOF
}
