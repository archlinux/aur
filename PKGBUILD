# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-privacybadger'
pkgver=2020.7.21
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/EFForg/privacybadger/6a86f1266f3f88fbd3a1ce8fe77ed5964dcaf91f/LICENSE")
noextract=("$pkgname-$pkgver.crx")
b2sums=('c87089f5de04d222dc976e68ea483c4544bcb65824dfd1117ecbe7ef8e012eba171dea8540fed9e9c3fc0d7bf2cbfa0a300ab8df3ab062f81cf80bba2f45db94'
        'b5865247e8de9c9f9bfefab669c2d31e26948393c90be7420756ef540fde9f2742ec137b065ad92516da52b3222ea619ec85b8106bba114dee735a3fc119ad6e')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
