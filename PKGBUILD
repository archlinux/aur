# Maintainer: Qingxu <me@linioi.com>
pkgname=herdr-core-bin
pkgver=0.1.16
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
sha256sums_x86_64=('58d6861176dc6fe905b58880d5bff07a9959be613a98e5d66b4583b04b6cfa45')
sha256sums_aarch64=('b6573137d70baff24fb346c957a9879af6bdc4c641188cdf9e47a7b2a677bc92')

package() {
    install -Dm755 "$srcdir/herdr-core" "$pkgdir/usr/bin/herdr-core"
    ln -s herdr-core "$pkgdir/usr/bin/hc"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
