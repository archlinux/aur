# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-core-bin
pkgver=0.1.18
pkgrel=1
pkgdesc='Background server that keeps Herdr terminals and coding agents running'
url='https://herdr.dev/core/'
arch=(
    'x86_64'
    'aarch64'
)
license=(
    'Apache-2.0'
)
provides=(
    "${pkgname%-bin}=$pkgver"
)
conflicts=(
    "${pkgname%-bin}"
)
options=(
    '!strip'
    '!debug'
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.tar.gz::https://releases.herdr.dev/core/$pkgver/herdr-core-linux-x86_64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.tar.gz::https://releases.herdr.dev/core/$pkgver/herdr-core-linux-aarch64.tar.gz"
)
sha256sums_x86_64=('5b2f97cb4b2a9d7a6b2cc5942628203ed9fbb7cc0c2b4b09ad8a6f5648e246b7')
sha256sums_aarch64=('cf33393cf950bb763734dc3e16610ab9daf8492391a4ef0de56026cd7f752853')

package() {
    install -Dm755 "$srcdir/herdr-core" "$pkgdir/usr/bin/herdr-core"
    ln -s herdr-core "$pkgdir/usr/bin/hc"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "$srcdir/LICENSE" "$srcdir/THIRD-PARTY-NOTICES"
}
