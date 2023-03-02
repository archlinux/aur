# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname='chromium-extension-privacybadger'
pkgver=2023.1.31
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-chrome.crx")
sha256sums=('0ac6a32bfe92577f2c12a61aac44d3d27b7f5934f0d72493341340f8502f208e')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
