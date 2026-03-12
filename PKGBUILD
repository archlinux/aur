# Maintainer: Libertaria <dev@libertaria.dev>
pkgname=lightpanda
pkgver=0.2.5
pkgrel=1
pkgdesc="Headless browser designed for AI and automation - 11x faster than Chrome, 9x less memory"
arch=('x86_64' 'aarch64')
url="https://lightpanda.io"
license=('AGPL-3.0-only')
provides=('lightpanda')

_x86_64_url="https://github.com/lightpanda-io/browser/releases/download/v${pkgver}/lightpanda-x86_64-linux"
_aarch64_url="https://github.com/lightpanda-io/browser/releases/download/v${pkgver}/lightpanda-aarch64-linux"

source_x86_64=("$_x86_64_url")
source_aarch64=("$_aarch64_url")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "$srcdir/lightpanda-x86_64-linux" "$pkgdir/usr/bin/lightpanda"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "$srcdir/lightpanda-aarch64-linux" "$pkgdir/usr/bin/lightpanda"
    fi
    chmod +x "$pkgdir/usr/bin/lightpanda"
}
