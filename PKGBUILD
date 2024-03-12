# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-decentraleyes'
_id='ldpochfccmkkmhdbclfhpagapcfdljkj'
pkgver=2.0.18
pkgrel=2
pkgdesc="Local emulation of Content Delivery Networks"
license=('MPL2')
arch=('any')
url="https://git.synz.io/Synzvato/decentraleyes"
depends=('chromium')
source=("$pkgname-$pkgver.crx::https://git.synz.io/Synzvato/decentraleyes/uploads/2bf87b82847e5340e04b75505d29a5ba/Decentraleyes.v$pkgver-chromium.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('166c9338a9eb6e43db8e83c363965b9eff482f2a3d173cba3fc81b1368ec9080')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > "$_id".json
}

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 "$_id".json "$pkgdir/usr/share/chromium/extensions/"$_id".json"
}
