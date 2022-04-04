# Maintainer: Qontinuum <qontinuum@artixlinux.org>

pkgname='chromium-extension-privacybadger'
pkgver=2021.11.23.1
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-chrome.crx")
sha256sums=('3aba0a15b9aef83902ad286a96cbe59de7e4113a4585e8e989bdd9f6b9f36dae')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
