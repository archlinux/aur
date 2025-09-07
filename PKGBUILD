# Maintainer: Leonardo Trapani <leo@trapani.sh>
pkgname=hyprvoice-bin
pkgver=0.1.3
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
sha256sums=('e0b01b52559936016b17165280bf74232ab58275b4f4e5ee71ee41cae2b27cbd'
            '19cba3b0431388fb5d38ad82f8fdb01a74f507dcd9f15b174e9fdafc6fd1b480')
install=hyprvoice.install

package() {
    # Install binary
    install -Dm755 "hyprvoice-${pkgver}" "${pkgdir}/usr/bin/hyprvoice"
    
    # Install systemd service file
    install -Dm644 hyprvoice.service "${pkgdir}/usr/lib/systemd/user/hyprvoice.service"
}
