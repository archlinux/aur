# Maintainer: Leonardo Trapani <leo@trapani.sh>
pkgname=hyprvoice-bin
pkgver=v0.1.10
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
    'ydotool: Alternative text injection backend (recommended for Chromium apps)'
)
provides=('hyprvoice')
conflicts=('hyprvoice')
source=(
    "hyprvoice-${pkgver}::https://github.com/leonardotrapani/hyprvoice/releases/download/${pkgver}/hyprvoice-linux-x86_64"
    "hyprvoice.service"
)
sha256sums=('1cb928c1543b15d09d98dc38ab94c71d28172c31fe5faf31db64f9154d139078'
            '5631c957777882870e61934176d2142fab6c553bb650ffd8b3eb74b8dce955bd')
install=hyprvoice.install

package() {
    # Install binary
    install -Dm755 "hyprvoice-${pkgver}" "${pkgdir}/usr/bin/hyprvoice"
    
    # Install systemd service file
    install -Dm644 hyprvoice.service "${pkgdir}/usr/lib/systemd/user/hyprvoice.service"
}
