# Maintainer: fibsussy <noahlykins@gmail.com>
pkgname=reaction-time-test
pkgver=0.0.0
pkgrel=1
pkgdesc="A CLI/TUI reaction time test inspired by Human Benchmark"
arch=('x86_64' 'aarch64')
url="https://github.com/fibsussy/reaction-time-test"
license=('MIT')
depends=()
makedepends=()
options=('!debug')

_arch="$CARCH"
if [ "$_arch" = "x86_64" ]; then
    _arch="x86_64"
elif [ "$_arch" = "aarch64" ]; then
    _arch="aarch64"
fi

source=(
    "reaction-time-test-${pkgver}-linux-${_arch}.tar.gz::https://github.com/fibsussy/reaction-time-test/releases/download/v${pkgver}/reaction-time-test-linux-${_arch}.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fibsussy/reaction-time-test/v${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/reaction-time-test" "$pkgdir/usr/bin/reaction-time-test"
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
