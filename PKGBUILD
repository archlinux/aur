# Maintainer: Szymon Porwolik <szporwolik@users.noreply.github.com>
pkgname=cqops-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Fast, minimal Go TUI ham radio logger"
arch=('x86_64')
url="https://github.com/szporwolik/cqops"
license=('Apache-2.0')
provides=('cqops')
conflicts=('cqops')
source=("cqops-${pkgver}-amd64.tar.gz::https://github.com/szporwolik/cqops/releases/download/v0.9.3/cqops-linux-amd64.tar.gz"
        "cqops.svg::https://raw.githubusercontent.com/szporwolik/cqops/v0.9.3/assets/cqops-icon.svg")
sha256sums=('38b4170f48a8b21619e06158feb569dfd1bb8d86722ea83bfcaa556b0f9073ca'
            'SKIP')
package() {
    install -Dm755 cqops-linux-amd64 "${pkgdir}/usr/bin/cqops"
    install -Dm644 cqops.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cqops.svg"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/cqops.desktop" << 'DESKTOP'
[Desktop Entry]
Name=CQOps
Comment=Fast, minimal Go TUI ham radio logger
Exec=cqops
Terminal=true
Type=Application
Categories=HamRadio;Utility;Network;
Keywords=ham;radio;logging;qso;adif;wsjtx;dx;contest;sota;pota;wwff;iota;wavelog;qrz;dxcc;flrig;hamlib;
Icon=utilities-terminal
StartupNotify=true
DESKTOP
}
