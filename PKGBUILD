# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=pass-pqp-ff-extension
pkgver=0.1.3
pkgrel=1
pkgdesc='Firefox/LibreWolf extension to browse a pass-pqp password store'
arch=('any')
url='https://github.com/ajdiaz/pass-pqp-ff-extension'
license=('MIT')
depends=('pass-pqp' 'pqp-crypto')
makedepends=('zip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ajdiaz/pass-pqp-ff-extension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d0663351ccb86ad77a9139022e43288bc7a092bc95ed2511a3de32d7af4a680')

build() {
    cd "$srcdir/pass-pqp-ff-extension-$pkgver"
    make build VERSION="$pkgver"
}

package() {
    cd "$srcdir/pass-pqp-ff-extension-$pkgver"
    install -Dm644 "dist/$pkgname-$pkgver.zip" "$pkgdir/usr/share/$pkgname/$pkgname-$pkgver.zip"
    install -Dm755 "native/pass-pqp-host.sh" "$pkgdir/usr/lib/$pkgname/pass-pqp-host.sh"
    install -Dm644 "native/pass-pqp-host.json.in" "$pkgdir/usr/share/$pkgname/pass-pqp-host.json.in"
    install -Dm644 "src/manifest.json" "$pkgdir/usr/share/$pkgname/manifest.json"
}
sha256sums=('9d0663351ccb86ad77a9139022e43288bc7a092bc95ed2511a3de32d7af4a680')
