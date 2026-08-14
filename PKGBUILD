# Maintainer: Jeff Hagadorn <noreply@github.com>
pkgname=z13gui-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='GTK4 overlay GUI companion for z13ctl'
arch=('x86_64')
url='https://github.com/dahui/z13gui'
license=('Apache-2.0')
provides=('z13gui')
conflicts=('z13gui')
depends=('glibc' 'gtk4' 'gtk4-layer-shell' 'z13ctl')
install=z13gui-bin.install
source=("https://github.com/dahui/z13gui/releases/download/v${pkgver}/z13gui_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0e6660766c3e080b2ddfaddc8b287c89e798cc5a99213a2e07269afbd6e8be77')

package() {
    install -Dm755 "z13gui"                                    "${pkgdir}/usr/bin/z13gui"
    install -Dm644 "LICENSE"                                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "NOTICE"                                    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    # Inter is compiled into the binary, so the OFL notice ships with it.
    install -Dm644 "internal/gui/fonts/LICENSE-Inter.txt"       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Inter.txt"
    install -Dm644 "contrib/z13gui.service"                    "${pkgdir}/usr/lib/systemd/user/z13gui.service"
    install -Dm644 "contrib/z13gui.desktop"                    "${pkgdir}/usr/share/applications/z13gui.desktop"
    install -Dm644 "contrib/99-z13gui-gamepad.rules"           "${pkgdir}/usr/lib/udev/rules.d/99-z13gui-gamepad.rules"
}
