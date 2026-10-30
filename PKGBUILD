# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-core-bin
pkgver=0.1.14
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
source=(
    "LICENSE::https://raw.githubusercontent.com/herdrdev/herdr-core/master/LICENSE"
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.tar.gz::https://releases.herdr.dev/core/$pkgver/herdr-core-linux-x86_64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.tar.gz::https://releases.herdr.dev/core/$pkgver/herdr-core-linux-aarch64.tar.gz"
)
sha256sums=('SKIP')
sha256sums_x86_64=('e9dbabdead0ce0ce3de51b6f54cc9549efedbb41b2f8448b6932ab0d1442343e')
sha256sums_aarch64=('19cef6a2e52f14c22c4b6f3fdaf1a462d2dafc78e8b03fabbfad5b063477a370')

package() {
    install -Dm755 "$srcdir/herdr-core" "$pkgdir/usr/bin/herdr-core"
    ln -s herdr-core "$pkgdir/usr/bin/hc"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
