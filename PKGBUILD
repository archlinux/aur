# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13gui-plus-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='Z13GUI+ GTK4 overlay companion for z13ctl-plus'
arch=('x86_64')
url='https://github.com/aic0d3r/z13gui-plus'
license=('Apache-2.0')
depends=('glibc' 'gtk4' 'gtk4-layer-shell' 'z13ctl-plus-bin')
provides=('z13gui-plus')
conflicts=('z13gui-plus')
install=z13gui-plus-bin.install
source=("https://github.com/aic0d3r/z13gui-plus/releases/download/v${pkgver}/z13gui-plus_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b8d2607ff7d34a867f22ef63785acab55473e7fb9cfae877830cb3ee315f261d')

package() {
    install -Dm755 "z13gui-plus"                               "${pkgdir}/usr/bin/z13gui-plus"
    install -Dm644 "LICENSE"                                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/z13gui-plus.service"               "${pkgdir}/usr/lib/systemd/user/z13gui-plus.service"
    install -Dm644 "contrib/io.github.aic0d3r.z13gui_plus.desktop" "${pkgdir}/usr/share/applications/io.github.aic0d3r.z13gui_plus.desktop"
    install -Dm644 "contrib/99-z13gui-plus-gamepad.rules"      "${pkgdir}/usr/lib/udev/rules.d/99-z13gui-plus-gamepad.rules"
}
