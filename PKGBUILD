# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

pkgname=rockbase
pkgver=0.2.0
pkgrel=1
pkgdesc="Offline database updater for rockbox."

arch=("x86_64")
license=("MIT")
url="https://github.com/iksteen/rockbase"

source=("$pkgname-$pkgver.tar.gz::https://github.com/iksteen/rockbase/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fed18955ad8805605f17f0db97ad7a5e3b6438681b553f73de0b1a0d016cf623')

depends=()
makedepends=("cargo")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/rockbase "$pkgdir/usr/bin/rockbase"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
