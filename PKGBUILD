# Maintainer: prankstr <https://github.com/prankstr>
# Keep depends/optdepends/options in sync across vibepanel, vibepanel-bin, and vibepanel-git.
pkgname=vibepanel-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="A GTK4 panel for Wayland with notifications, OSD, and quick settings"
arch=('x86_64')
url="https://github.com/prankstr/vibepanel"
license=('MIT')
# systemd-libs provides libudev used by the brightness service.
depends=('gtk4' 'gtk4-layer-shell' 'libpulse' 'upower' 'networkmanager' 'bluez' 'systemd-libs')
optdepends=('power-profiles-daemon: power profile switching in battery popover'
            'modemmanager: cellular/mobile network support'
            'cava: audio visualizer in the media widget'
            'iwd: alternative to NetworkManager for Wi-Fi')
provides=('vibepanel')
conflicts=('vibepanel' 'vibepanel-git')
options=(!debug)
source=("vibepanel-${pkgver}::https://github.com/prankstr/vibepanel/releases/download/v${pkgver}/vibepanel-x86_64-unknown-linux-gnu"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/prankstr/vibepanel/v${pkgver}/LICENSE")
sha256sums=('4b481abdba319773b669e263fcfb843dde9f9812a322a7d4f9d232e6c6f9815c'
            'bd1e1e78cb74074a2d09d2a4e87675991cdfb45c90dd4746728d8daeb480f9ac')

package() {
    install -Dm755 "${srcdir}/vibepanel-${pkgver}" "${pkgdir}/usr/bin/vibepanel"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
