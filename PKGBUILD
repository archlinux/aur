# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-privacybadger'
pkgver=2020.6.29
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://www.eff.org/files/privacy_badger-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('a433fee9ae6556a283acb9642d27cf1d80c52f35e2363982275bba1bbf210a12b63bc96cc00566299e6156cf56627fa1d8d4faf8468c245ec76c5bfbd18b3c1a')

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    
    install -dm755 "$pkgdir/usr/share/chromium/extensions/"

    echo '{'                                                        > "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    echo "\"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\"," >> "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    echo "\"external_version\": \"$pkgver\""                       >> "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
    echo '}'                                                       >> "$pkgdir/usr/share/chromium/extensions/pkehgijcmpdhfbdbbnkijodmdjhbjlgp.json"
}
