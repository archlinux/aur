# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=upmd-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Markdown-based task and workflow runner"
arch=("x86_64" "aarch64")
url="https://github.com/rezigned/upmd"
license=("MIT")
depends=("glibc")
provides=("upmd")
conflicts=("upmd")

source_x86_64=("https://github.com/rezigned/upmd/releases/download/v${pkgver}/upmd-x86_64-unknown-linux-gnu.tar.xz")

source_aarch64=("https://github.com/rezigned/upmd/releases/download/v${pkgver}/upmd-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('9befb2bd007e8425602c144f039326dc2a94a117019aca12c959b9b9ebc982ea')
sha256sums_aarch64=('17148c7eef9aa96aecce0fb79d1deec459ab46e6ec8566126eb4cd3a3f5f6869')


package() {
    install -Dm755 "$srcdir/upmd-${CARCH}-unknown-linux-gnu/upmd"      "$pkgdir/usr/bin/upmd"
    install -Dm644 "$srcdir/upmd-${CARCH}-unknown-linux-gnu/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/upmd-${CARCH}-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
