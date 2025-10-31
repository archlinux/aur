# Maintainer: Lluciocc <llucio.cc00@example.com>
pkgname=connex
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern Wi-Fi Manager for Hyprland/ArchLinux with GTK3 interface"
arch=('any')
url="https://github.com/Lluciocc/connex"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'networkmanager'
    'libappindicator-gtk3'
    'libnotify'
)
optdepends=(
    'papirus-icon-theme: Better icons'
    'hyprland: Recommended window manager'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('07dc1802fe10aed570e560f70277eb548115eea3095a46923202592bc4178129')

# For local development, use:
# source=("connex.py")
# sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install main script
    install -Dm755 connex.py "${pkgdir}/usr/bin/connex"
    
    # Install desktop file
    install -Dm644 connex.desktop "${pkgdir}/usr/share/applications/connex.desktop"
    
    # Install icon
    install -Dm644 connex.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/connex.svg"
    
    # Install autostart file for tray
    install -Dm644 connex-tray.desktop "${pkgdir}/etc/xdg/autostart/connex-tray.desktop"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
