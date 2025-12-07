# Maintainer: Nate Craft <secondarynate at icloud dot com>
pkgname=dashi
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal shell for linux window managers"
arch=('x86_64')
url="https://github.com/nate-craft/dashi"
license=('MIT')
depends=('libpulse' 'libnotify')
optdepends=('gammastep: provides nightshift')
conflicts=()
source=("https://github.com/nate-craft/dashi/releases/download/${pkgver}/dashi-${pkgver}-x86_64-unknown-linux-gnu"
    "90-backlight.rules" "30-bluetooth.rules")
sha256sums=('eb45bb2a7ae2892dee1e8fa489084cfae23728d904e1519ae76d8f21e908138e'             '3157113d400685886ef5a45b714a76d59bc08e0c1e7f8fb2b6dc7b2529daa55f'             'd3b14a1e63bfa865386e1556b11eb642ccad91ddb36938803e55c08effe59e50') 

package() {
    install -Dm755 "${srcdir}/dashi-${pkgver}-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/dashi"
    install -Dm644 "${srcdir}/90-backlight.rules" "${pkgdir}/etc/udev/rules.d/90-backlight.rules"
    install -Dm644 "${srcdir}/30-bluetooth.rules" "${pkgdir}/etc/polkit-1/rules.d/30-bluetooth.rules"
}
