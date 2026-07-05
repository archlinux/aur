# Maintainer: skint007 <archlinux.repose742@passmail.net>
pkgname=yay-sys-tray-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Arch Linux system tray update checker using yay (prebuilt binary)"
arch=('x86_64')
url="https://github.com/skint007/yay-sys-tray"
license=('MIT')
depends=(webkit2gtk-4.1 gtk3 libayatana-appindicator pacman-contrib yay)
optdepends=('tailscale: remote server update checking via Tailscale'
            'openssh: SSH access for remote server update checks')
provides=('yay-sys-tray')
conflicts=('yay-sys-tray' 'yay-sys-tray-git')
install=yay-sys-tray-bin.install
source=("yay-sys-tray-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/yay-sys-tray-${pkgver}-x86_64.tar.gz")
# Checksum is recomputed and stamped by the release CI (build.yml -> aur-bin job).
sha256sums=('a1837ffb326337259ff91d2fc8c4bc203164e1c4a55a01947fda39d6b7528638')

package() {
    install -Dm755 "${srcdir}/yay-sys-tray" "${pkgdir}/usr/bin/yay-sys-tray"
    install -Dm644 "${srcdir}/yay-sys-tray.desktop" "${pkgdir}/usr/share/applications/yay-sys-tray.desktop"
    install -Dm644 "${srcdir}/yay-sys-tray.service" "${pkgdir}/usr/lib/systemd/user/yay-sys-tray.service"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
