# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-decentraleyes'
pkgver=2.0.15
pkgrel=1
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/fb62517def30cc1a2c3f78f439a7cfa3/Decentraleyes.v2.0.15-chromium.crx")
noextract=("$pkgname-$pkgver.crx")
b2sums=('7defd4c80d6a2c22ab6544ae2a246df7e0c1ff448c7ecd0fc387011809270bdc2621f3bdcfb6a5ab5262376c0b675c03ae123940f49f4adba5d82fd89317f763')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > ldpochfccmkkmhdbclfhpagapcfdljkj.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 ldpochfccmkkmhdbclfhpagapcfdljkj.json "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
}
