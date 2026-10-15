# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13gui-plus-bin
pkgver=2.6.0
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
sha256sums=('95636766c5ddb26415f4024c47a54d98fff39ac6b9a90e6febf1dbf655c2cdbe')

package() {
    install -Dm755 "z13gui-plus"                               "${pkgdir}/usr/bin/z13gui-plus"
    install -Dm644 "LICENSE"                                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/z13gui-plus.service"               "${pkgdir}/usr/lib/systemd/user/z13gui-plus.service"
    install -Dm644 "contrib/io.github.aic0d3r.z13gui_plus.desktop" "${pkgdir}/usr/share/applications/io.github.aic0d3r.z13gui_plus.desktop"
    install -d "${pkgdir}/usr/share/kglobalaccel"
    ln -s "../applications/io.github.aic0d3r.z13gui_plus.desktop" "${pkgdir}/usr/share/kglobalaccel/io.github.aic0d3r.z13gui_plus.desktop"
    install -Dm644 "contrib/70-z13gui-plus-gamepad.rules"      "${pkgdir}/usr/lib/udev/rules.d/70-z13gui-plus-gamepad.rules"
}
