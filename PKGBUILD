# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-privacybadger'
pkgver=2020.8.25
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/EFForg/privacybadger/6a86f1266f3f88fbd3a1ce8fe77ed5964dcaf91f/LICENSE")
b2sums=('9fa369a9f40d6997724d4219e16cb9685d156bba90d9d54b5c86d07ebda9be80944e719416bd09e15aa48e4bbe9ccd2f7ae672fdbcd8271ae519da37a3999078'
        'b5865247e8de9c9f9bfefab669c2d31e26948393c90be7420756ef540fde9f2742ec137b065ad92516da52b3222ea619ec85b8106bba114dee735a3fc119ad6e')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
