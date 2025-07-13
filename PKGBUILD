# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>

pkgname=wayland-font-dpi
pkgver=1.0.43
pkgrel=1
pkgdesc="Automatic text scaling for Wayland compositors based on physical display DPI"
arch=('any')
url="https://github.com/acrion/wayland-font-dpi"
license=('AGPL3')
depends=('bc' 'systemd' 'dbus' 'glib2' 'inotify-tools' 'gawk' 'sed' 'wayland-display-info')
makedepends=('git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${pkgname}-${pkgver}"
    
    # Executables
    install -Dm755 "wayland-font-dpi" "${pkgdir}/usr/lib/${pkgname}/wayland-font-dpi"
    install -Dm755 "wayland-font-dpi-session" "${pkgdir}/usr/lib/${pkgname}/wayland-font-dpi-session"
    
    # Systemd system service
    install -Dm644 "wayland-font-dpi.service" "${pkgdir}/usr/lib/systemd/system/wayland-font-dpi.service"
    
    # Per‑user systemd service
    install -Dm644 "wayland-font-dpi-session.service" "${pkgdir}/usr/lib/systemd/user/wayland-font-dpi-session.service"
    
    # Man page, Documentation & License
    install -Dm644 "wayland-font-dpi.1" "${pkgdir}/usr/share/man/man1/wayland-font-dpi.1"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
