# shellcheck shell=bash disable=SC2034,SC2154
pkgname=upmd-bin
pkgver=0.2.7
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

sha256sums_x86_64=('101336d7a8f4648a3bf894d5636875f1df3d219719d470096c562e0cf4d6b9aa')

sha256sums_aarch64=('213c77a602d33628508fdea9cc4bb2e6238030e57528b748ca5137f70542e7a0')

package() {
    install -Dm755 "$srcdir/upmd-${CARCH}-unknown-linux-gnu/upmd"      "$pkgdir/usr/bin/upmd"
    install -Dm644 "$srcdir/upmd-${CARCH}-unknown-linux-gnu/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/upmd-${CARCH}-unknown-linux-gnu/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
