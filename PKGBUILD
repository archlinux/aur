# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname='chromium-extension-privacybadger'
pkgver=2021.6.8
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx")
b2sums=('e5c6022e33a9374d6e759e61222bbd0781cb10428eba7228c5abffc0a978ad3258fb1dbc45db4908be6339342004c043e20eec08c6d2c40ceb9b58be3f17f8f3')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
