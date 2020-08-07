# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='chromium-extension-decentraleyes'
pkgver=2.0.13
pkgrel=1
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/7038d13b79b312c606719ed60550e492/Decentraleyes.v2.0.13-chromium.crx"
        "LICENSE-$pkgver::https://git.synz.io/Synzvato/decentraleyes/-/raw/29b029b24cba4f65b0cf031dd6e0ce9dd94439c9/LICENSE.txt")
noextract=("$pkgname-$pkgver.crx"
           "LICENSE-$pkgver")
b2sums=('154af1a6c6b5dfda98954c3c01b3a42e1d11d33cba96425a016fccdc6a3f25e14cecdd165b7fefbe165df960c572a031790093796dc020f5daac6944581e7b85'
        '1886e6edddc9c5c639654617ea3237cdfe83ae6b3a8e5e36552b6db2557e2e7516c43a67147ec9b94530ccaa68001540150c960ccad1ed894bf385bfa6d9093b')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > ldpochfccmkkmhdbclfhpagapcfdljkj.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 ldpochfccmkkmhdbclfhpagapcfdljkj.json "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
