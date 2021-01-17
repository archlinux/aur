# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=thunderbird-extension-tbkeys
pkgver=2.1.2
pkgrel=1
pkgdesc="Custom commands, functions, and keybindings for Thunderbird"
arch=(any)
depends=('thunderbird>=68')
url="https://github.com/wshanks/tbkeys"
license=(MPL)
source=(tbkeys-$pkgver.xpi::https://github.com/wshanks/tbkeys/releases/download/v$pkgver/tbkeys.xpi)
sha256sums=(3d2cceec290753b65089770b1a8d4e8d4a50b317dcbfde93015807ce935b47cb)

package() {
    cd "$srcdir"
    _id="$(grep -oP '(?<="id": ")[^"]*' manifest.json)"
    install -Dm644 tbkeys-$pkgver.xpi "$pkgdir"/usr/lib/thunderbird/extensions/$_id.xpi
}
