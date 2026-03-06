# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.17.1
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("01a71df98a1304b07a64e97aaa00010518b87ec860dbf2ca1521f3c9c0e7213f")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("9b402b8b4689de915b75dcc68894807276611055ed7bce3e5620af08073e6fa1")

package () {
    cd "minijinja-cli-$CARCH-unknown-linux-gnu"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
