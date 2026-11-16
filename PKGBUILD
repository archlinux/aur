# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=vykar-gui-bin
pkgver=0.22.0
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
sha256sums_x86_64=('6cb9c6ff7b0dfa9e78c33c21077c42e8450ef85d51b3aec2f7d92be5d8bcafd6')
source_aarch64=("vykar-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/borgbase/vykar/releases/download/v${pkgver}/vykar-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('fec1465170045c1084c84368c3bb94e9923b3f0f75b51ec7cbac66487fd13ad3')

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
