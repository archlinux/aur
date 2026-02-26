# Maintainer: Jeff Hagadorn <noreply@github.com>
pkgname=z13gui-bin
pkgver=1.0.1
pkgrel=2
pkgdesc='GTK4 overlay GUI companion for z13ctl'
arch=('x86_64')
url='https://github.com/dahui/z13gui'
license=('Apache-2.0')
provides=('z13gui')
conflicts=('z13gui')
depends=('glibc' 'gtk4' 'gtk4-layer-shell' 'z13ctl')
install=z13gui-bin.install
source=("https://github.com/dahui/z13gui/releases/download/v${pkgver}/z13gui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7d1fb216af90d8979e29cb4f301cc913a5dd0a192c217c6652c5cf34ea999a84')

package() {
    install -Dm755 "z13gui"                                    "${pkgdir}/usr/bin/z13gui"
    install -Dm644 "LICENSE"                                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/z13gui.service"                    "${pkgdir}/usr/lib/systemd/user/z13gui.service"
    install -Dm644 "contrib/z13gui.desktop"                    "${pkgdir}/usr/share/applications/z13gui.desktop"
    install -Dm644 "contrib/99-z13gui-gamepad.rules"           "${pkgdir}/usr/lib/udev/rules.d/99-z13gui-gamepad.rules"
}
