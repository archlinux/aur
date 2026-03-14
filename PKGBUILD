# Maintainer: matt-shearing <matt-shearing@users.noreply.github.com>
pkgname=voxtype-tray
pkgver=1.0.0
pkgrel=1
pkgdesc="System tray app and settings GUI for VoxType voice dictation (PyQt6)"
arch=('any')
url="https://github.com/matt-shearing/voxtype-tray"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'voxtype'
)
optdepends=(
    'dotool: keyboard simulation for KDE Plasma Wayland (recommended)'
    'wtype: keyboard simulation for Sway/wlroots compositors'
    'wl-clipboard: clipboard fallback support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matt-shearing/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08ae5beb2ad55b001eae398cfc26ee068a9b02878dee2350d9bf466b56aee5aa')

package() {
    cd "${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 voxtype-tray.py "${pkgdir}/usr/bin/voxtype-tray"

    # Desktop entry (app menu + autostart)
    install -Dm644 voxtype-tray.desktop "${pkgdir}/usr/share/applications/voxtype-tray.desktop"
    install -Dm644 voxtype-tray.desktop "${pkgdir}/etc/xdg/autostart/voxtype-tray.desktop"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
