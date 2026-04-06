# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=dashi
pkgver=1.0.8
pkgrel=2
pkgdesc="Minimal shell for linux window managers"
arch=('x86_64')
url="https://github.com/nate-craft/dashi"
license=('GPL-2.0')
depends=('libpulse' 'libnotify')
optdepends=('gammastep: provides nightshift')
conflicts=()
source=("https://github.com/nate-craft/dashi/releases/download/${pkgver}/dashi-${pkgver}-x86_64-unknown-linux-gnu"
    "90-backlight.rules" "30-bluetooth.rules" "91-leds.rules")
sha256sums=('ee818c3aa73887544ece8cc6c6fa8f45e9699b84c8c00f420640b29cde0a722f'             '3157113d400685886ef5a45b714a76d59bc08e0c1e7f8fb2b6dc7b2529daa55f'             'd3b14a1e63bfa865386e1556b11eb642ccad91ddb36938803e55c08effe59e50'             '7641f87e287ffcc901da801ddf4522be65e5c2db81af14d2abec61ff477ddb59') 

package() {
    rm -f "$pkgdir/etc/udev/rules.d/90-backlight.rules"
    rm -f "$pkgdir/etc/udev/rules.d/30-bluetooth.rules"
    rm -f "$pkgdir/etc/udev/rules.d/91-leds.rules"

    install -Dm755 "${srcdir}/dashi-${pkgver}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/dashi"
    install -Dm644 "${srcdir}/90-backlight.rules" "${pkgdir}/etc/udev/rules.d/90-backlight.rules"
    install -Dm644 "${srcdir}/30-bluetooth.rules" "${pkgdir}/etc/udev/rules.d/30-bluetooth.rules"
    install -Dm644 "${srcdir}/91-leds.rules" "${pkgdir}/etc/udev/rules.d/91-leds.rules"
}
