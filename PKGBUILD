# Maintainer: aic0d3r <funforfreeapps@gmail.com>
pkgname=z13gui-plus-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Z13GUI+ GTK4 overlay companion for z13ctl'
arch=('x86_64')
url='https://github.com/aic0d3r/z13gui-plus'
license=('Apache-2.0')
provides=('z13gui')
conflicts=('z13gui')
replaces=('z13gui')
depends=('glibc' 'gtk4' 'gtk4-layer-shell' 'z13ctl')
install=z13gui-plus-bin.install
source=("https://github.com/aic0d3r/z13gui-plus/releases/download/v${pkgver}/z13gui-plus_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c20f78affa1e21db64187bcde9f47242204dbc759ddeabd314fce7868efe998d')

package() {
    install -Dm755 "z13gui"                                    "${pkgdir}/usr/bin/z13gui"
    install -Dm644 "LICENSE"                                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "contrib/z13gui.service"                    "${pkgdir}/usr/lib/systemd/user/z13gui.service"
    install -Dm644 "contrib/z13gui.desktop"                    "${pkgdir}/usr/share/applications/z13gui.desktop"
    install -Dm644 "contrib/99-z13gui-gamepad.rules"           "${pkgdir}/usr/lib/udev/rules.d/99-z13gui-gamepad.rules"
}
