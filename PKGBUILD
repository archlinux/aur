# Maintainer: Szymon Porwolik <szporwolik@users.noreply.github.com>
pkgname=cqops-bin
pkgver=0.9.2
pkgrel=3
pkgdesc="Fast, minimal Go TUI ham radio logger"
arch=('x86_64')
url="https://github.com/szporwolik/cqops"
license=('Apache-2.0')
provides=('cqops')
conflicts=('cqops')
source=("cqops-${pkgver}-amd64.tar.gz::https://github.com/szporwolik/cqops/releases/download/v0.9.2/cqops-linux-amd64.tar.gz"
        "cqops.svg::https://raw.githubusercontent.com/szporwolik/cqops/v0.9.2/assets/cqops-icon.svg")
sha256sums=('a811d365300658be119c5ff342ffe1e5ae84eba588675be0400bc308f97b8715'
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
Icon=cqops
StartupNotify=true
DESKTOP
}