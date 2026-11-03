# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-core-bin
pkgver=0.1.17
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
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('82ec44043f6894bfdb716b979b87cda43fd7fa46b0104e7b7bd93e64d1a9b877')
sha256sums_aarch64=('3a37a454ec63494cf4306db26481fe9db96673d888723701d24f8a992ae8ab8c')

package() {
    install -Dm755 "$srcdir/herdr-core" "$pkgdir/usr/bin/herdr-core"
    ln -s herdr-core "$pkgdir/usr/bin/hc"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
