# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-decentraleyes'
pkgver=2.0.13
pkgrel=1
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/7038d13b79b312c606719ed60550e492/Decentraleyes.v$pkgver-chromium.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('154af1a6c6b5dfda98954c3c01b3a42e1d11d33cba96425a016fccdc6a3f25e14cecdd165b7fefbe165df960c572a031790093796dc020f5daac6944581e7b85')

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    
    install -dm755 "$pkgdir/usr/share/chromium/extensions/"

    echo '{'                                                        > "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
    echo "\"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\"," >> "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
    echo "\"external_version\": \"$pkgver\""                       >> "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
    echo '}'                                                       >> "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
}
