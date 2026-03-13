# Maintainer: prankstr <https://github.com/prankstr>
pkgname=vibepanel-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A GTK4 panel for Wayland with notifications, OSD, and quick settings"
arch=('x86_64')
url="https://github.com/prankstr/vibepanel"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'libpulse' 'upower' 'networkmanager' 'bluez')
optdepends=('power-profiles-daemon: power profile switching in battery popover')
provides=('vibepanel')
conflicts=('vibepanel' 'vibepanel-git')
options=(!debug)
source=("vibepanel-${pkgver}::https://github.com/prankstr/vibepanel/releases/download/v${pkgver}/vibepanel-x86_64-unknown-linux-gnu"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/prankstr/vibepanel/v${pkgver}/LICENSE")
sha256sums=('80436a533a3537adf33ef7e1c8e666dea402c7f05930e95f54fc550dc8c8de99'
            'bd1e1e78cb74074a2d09d2a4e87675991cdfb45c90dd4746728d8daeb480f9ac')

package() {
    install -Dm755 "${srcdir}/vibepanel-${pkgver}" "${pkgdir}/usr/bin/vibepanel"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
