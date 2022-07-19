# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='vkteams-bin'
pkgbasename='vkteams'
pkgver='10.0.0.18759'
pkgrel='1'
pkgdesc='Official desktop application for the VK Teams messaging service'
arch=("x86_64")
url='https://teams.vk.com'
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
source=("${pkgbasename}-${pkgver}.tar.xz::https://vkteams-www.hb.bizmrg.com/linux/x64/vkteams.tar.xz"
        'vkteams.sh'
        'vkteams.png'
        'vkteams.desktop')
sha256sums=('320f90d618061cb620cc4e0b9b701b7b1162f261a73e76483248e451c212a5ae'
            'a2afc2dbd79e67736511c91b3d8f0a5fe3800c929ead9909d1b8f90fe7a7ca4b'
            '455842f3b3045a590e03372ae1f9ca75fc935d2cc829c379eaf01acefba97d68'
            '4f29a8011226d2523819a8b39bf2e5923c0bd0bc1748b7d4bb8eb5b57887e02a')
options=('!strip')

shopt -s extglob

package() {
    install -dm755 "$pkgdir/opt/${pkgbasename}"
    install -dm755 "$pkgdir/usr/bin"
    cp -ar "$srcdir/"!(${pkgbasename}.desktop|${pkgbasename}-${pkgver}.tar.xz|${pkgbasename}.sh|${pkgbasename}.png) "$pkgdir/opt/${pkgbasename}"
    install -Dm755 "../${pkgbasename}.sh" "$pkgdir/usr/bin/${pkgbasename}"
    install -Dm644 "../${pkgbasename}.desktop" "$pkgdir/usr/share/applications/${pkgbasename}.desktop"
    install -Dm644 "../${pkgbasename}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgbasename}.png"
}
