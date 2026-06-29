# Maintainer: mryll <https://github.com/mryll>
pkgname=waynote-bin
_pkgname=waynote
pkgver=0.1.2
pkgrel=1
pkgdesc='Wayland-native markdown sticky notes for tiling WMs (wlr-layer-shell) — prebuilt binary'
arch=('x86_64')
url='https://github.com/mryll/waynote'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('waynote')
conflicts=('waynote')
options=(!debug)
source=("waynote-${pkgver}::https://github.com/mryll/waynote/releases/download/v${pkgver}/waynote-${pkgver}-x86_64-linux"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/mryll/waynote/v${pkgver}/LICENSE"
        "waynote-${pkgver}.svg::https://raw.githubusercontent.com/mryll/waynote/v${pkgver}/assets/waynote.svg"
        "waynote-${pkgver}.desktop::https://raw.githubusercontent.com/mryll/waynote/v${pkgver}/packaging/waynote.desktop"
        "waynote-${pkgver}.service::https://raw.githubusercontent.com/mryll/waynote/v${pkgver}/packaging/waynote.service")
sha256sums=('cdeacb66b0b54d9bd5511e2be411587ddc2052cb51ae580d3b62c048c3009635'
            'd5f99ad0559c66d3641d188c3aa3787fd8ed6a12ca45836661648f2755a51a2a'
            '9dfc535d312fc30f001065faa50fcb5c8aeabe9e89733953b2c209f62eb953c5'
            '98d01a5708b3400566310a863bf49be5e66181e51373656f203769278f041646'
            '19907bf1d66c32befde2bdcc6c863c1c1a0df9f8d5a84b2c416b8501e730d9fe')

package() {
    install -Dm755 "waynote-${pkgver}" "$pkgdir/usr/bin/waynote"
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "waynote-${pkgver}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/waynote.svg"
    install -Dm644 "waynote-${pkgver}.desktop" "$pkgdir/usr/share/applications/waynote.desktop"
    install -Dm644 "waynote-${pkgver}.service" "$pkgdir/usr/lib/systemd/user/waynote.service"
}
