# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='vkteams-bin'
pkgver='10.0.0.18759'
pkgrel='1'
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://teams.vk.com'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.xz::https://vkteams-www.hb.bizmrg.com/linux/x64/vkteams.tar.xz")
sha256sums=('320f90d618061cb620cc4e0b9b701b7b1162f261a73e76483248e451c212a5ae')
options=('!strip')

package() {
    rm "${pkgname%-bin}-${pkgver}.tar.xz"
    mkdir -p "$pkgdir/opt/${pkgname%-bin}"
    mkdir -p "$pkgdir/usr/bin"
    cp -a "$srcdir/"* "$pkgdir/opt/${pkgname%-bin}"
    install -Dm0755 "../${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "../${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "../${pkgname%-bin}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
}
