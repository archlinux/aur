# Maintainer: Tim Yang <protonmail = timdyang>

pkgname=thunderbird-extension-tbkeys
pkgver=2.1.3
pkgrel=1
pkgdesc="Custom commands, functions, and keybindings for Thunderbird"
arch=(any)
depends=('thunderbird>=68')
url="https://github.com/wshanks/tbkeys"
license=(MPL)
source=(tbkeys-$pkgver.xpi::https://github.com/wshanks/tbkeys/releases/download/v$pkgver/tbkeys.xpi)
sha256sums=(2fa6f23bb107964f13a77c57120b2d02a3e0bfadc765902b405b407a6c16670b)

package() {
    cd "$srcdir"
    _id="$(grep -oP '(?<="id": ")[^"]*' manifest.json)"
    install -Dm644 tbkeys-$pkgver.xpi "$pkgdir"/usr/lib/thunderbird/extensions/$_id.xpi
}
