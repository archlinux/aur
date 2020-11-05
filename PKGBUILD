# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-decentraleyes'
pkgver=2.0.14
pkgrel=2
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/a4b5244860fe6b41f36b49255ebc3c0a/Decentraleyes.v2.0.14-chromium.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('52f0ce373ebf9f072d47f64f84807c7290279ab32fa6c281c0b46428771f2a40aee2f0056e9bfef60142af2749500881732f561a649d93b08f34b0a058dbeefc')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > ldpochfccmkkmhdbclfhpagapcfdljkj.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 ldpochfccmkkmhdbclfhpagapcfdljkj.json "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
}
