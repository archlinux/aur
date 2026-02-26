# Maintainer: Mattes Rötschke <dev at mattes-roetschke dot de>
pkgname=envelope-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="An environment variables cli tool backed by SQLite "
arch=('x86_64')
url="https://github.com/mattrighetti/envelope"
license=('Unlicense' 'MIT')

source=(
    "envelope-${pkgver}-x86_64.tar.gz::https://github.com/mattrighetti/envelope/releases/download/${pkgver}/envelope-${pkgver}-x86_64-unknown-linux-musl.tar.gz"
    "LICENSE-MIT::https://raw.githubusercontent.com/mattrighetti/envelope/refs/tags/${pkgver}/LICENSE-MIT"
    "LICENSE-UNLICENSE::https://raw.githubusercontent.com/mattrighetti/envelope/refs/tags/${pkgver}/LICENSE-UNLICENSE"
)

sha256sums=('c47d0f773f5fcdca65a18648ab9ffbf15f6af76d20934b3ff8e5c4725f96f0df'
            '4a63d963c1c4a57fe5343f6fbf3c577d581629aa1b7c8e434eddced767859aab'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c'
)

options=('!debug')

package() {
    cd "envelope-${pkgver}-x86_64-unknown-linux-musl"
    install -Dm755 envelope "$pkgdir/usr/bin/envelope"
    install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/LICENSE-UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-UNLICENSE"
}
