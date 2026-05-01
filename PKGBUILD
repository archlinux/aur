# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3 Flash.
pkgname=vykar-gui-bin
pkgver=0.14.1
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
sha256sums_x86_64=('00d5279b9d8e83017b29e3437884ec3afaf1dd248d7712fafca8bdb419850f3b')
source_aarch64=("vykar-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/borgbase/vykar/releases/download/v${pkgver}/vykar-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('cfddadd6f3a394c69863e9bc43f95dc7415985ade4d06ec3c2fefddcc160d49b')

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
