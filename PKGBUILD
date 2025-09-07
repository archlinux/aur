# Maintainer: Leonardo Trapani <leo@trapani.sh>
pkgname=hyprvoice-bin
pkgver=0.1.2
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
sha256sums=('aac0ba89ff96104b526bdbca7e70da17b6c77c44925181a1b9dafc65ca9b3da4'
            '8a9a764753c740a6c76e4173ccfb97b6e984ba52978124e307cebc9d62ed2596')
install=hyprvoice.install

package() {
    # Install binary
    install -Dm755 "hyprvoice-${pkgver}" "${pkgdir}/usr/bin/hyprvoice"
    
    # Install systemd service file
    install -Dm644 hyprvoice.service "${pkgdir}/usr/lib/systemd/user/hyprvoice.service"
}
