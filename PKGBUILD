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
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('c87089f5de04d222dc976e68ea483c4544bcb65824dfd1117ecbe7ef8e012eba171dea8540fed9e9c3fc0d7bf2cbfa0a300ab8df3ab062f81cf80bba2f45db94')

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    
    install -dm755 "$pkgdir/usr/share/chromium/extensions/"

    echo '{'                                                        > "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    echo "\"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\"," >> "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    echo "\"external_version\": \"$pkgver\""                       >> "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    echo '}'                                                       >> "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
