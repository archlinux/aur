# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname='chromium-extension-privacybadger'
pkgver=2021.2.2
pkgrel=2
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx")
b2sums=('85c06384f38db14984cf66395b01d5ec8e4c8982b788305f4bd45c1b0c6b7ea40c1cdd562cac850d0205c98bac3b6f7ae6ccd17f347f50d84a9c163bff197374')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
