# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-core-bin
pkgver=0.1.20
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
sha256sums_x86_64=('ac6b86890c451a37584620aaa438b71bc0d0bd430a2e7c1d7e095f052c414e74')
sha256sums_aarch64=('5f3037379d15cc76cfc72d2fd1a4262ea1c5b24df278bf7cfd8adcff7b914862')

package() {
    install -Dm755 "$srcdir/herdr-core" "$pkgdir/usr/bin/herdr-core"
    ln -s herdr-core "$pkgdir/usr/bin/hc"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "$srcdir/LICENSE" "$srcdir/THIRD-PARTY-NOTICES"
}
