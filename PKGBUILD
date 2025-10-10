# Maintainer: Leonardo Trapani <leo@trapani.sh>
pkgname=hyprvoice-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Voice-powered typing for Wayland/Hyprland"
arch=('x86_64')
url="https://github.com/leonardotrapani/hyprvoice"
license=('MIT')
depends=(
    'pipewire'
    'pipewire-pulse'
    'pipewire-audio'
    'wl-clipboard'
    'wtype'
    'libnotify'
    'systemd'
)
optdepends=(
    'hyprland: For Hyprland window manager integration'
    'sway: For Sway window manager integration'
)
provides=('hyprvoice')
conflicts=('hyprvoice')
source=(
    "hyprvoice-${pkgver}::https://github.com/leonardotrapani/hyprvoice/releases/download/${pkgver}/hyprvoice-linux-x86_64"
    "hyprvoice.service"
)
sha256sums=('5dc88ac616659adb2026043c0c9bd046f3dcfdb1fcca8962ef5994d5c245c631'
            'bc4d17afa3a56fc50b09faae4cef9faf2a4ec7f08798b4098ba41ad78b02ab20')
install=hyprvoice.install

package() {
    # Install binary
    install -Dm755 "hyprvoice-${pkgver}" "${pkgdir}/usr/bin/hyprvoice"
    
    # Install systemd service file
    install -Dm644 hyprvoice.service "${pkgdir}/usr/lib/systemd/user/hyprvoice.service"
}
