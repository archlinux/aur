# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname='chromium-extension-privacybadger'
pkgver=2023.6.23
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-chrome.crx")
sha256sums=('6ec1875afca1e5bbeb5e6d3b6240f7493be5600eceaf0da3ad14fa2660785a79')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
