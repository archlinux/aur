# Maintainer: Mattes Rötschke <dev at mattes-roetschke dot de>
pkgname=envelope-bin
pkgver=0.8.0
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

sha256sums=('33210b651eae2f5d07605cb9ca772ca9f28909cce420c08ac08815d69a11dc9d'
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
