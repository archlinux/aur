# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-decentraleyes'
pkgver=2.0.17
pkgrel=1
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/c6483673bef7c90acb552b66111a3c76/Decentraleyes.v$pkgver-chromium.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('f5fdaaecc0a7f397e5a46aaeb4c6bf868c06254ea803515767cb8febc98deb64')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > ldpochfccmkkmhdbclfhpagapcfdljkj.json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 ldpochfccmkkmhdbclfhpagapcfdljkj.json "$pkgdir/usr/share/chromium/extensions/ldpochfccmkkmhdbclfhpagapcfdljkj.json"
}
