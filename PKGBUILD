# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname='chromium-extension-privacybadger'
pkgver=2023.5.10
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-chrome.crx")
sha256sums=('c6a3409ecc6668551deb64e8dd3884a9b670b215bf8aa0b4d705939e7512b1e7')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
