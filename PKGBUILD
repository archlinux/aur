# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=codegraph-rs-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Local-first code intelligence: tree-sitter knowledge graph + MCP server (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Cleboost/codegraph-rs"
license=('MIT')
provides=('codegraph')
conflicts=('codegraph' 'codegraph-bin')
options=(!strip !debug)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/codegraph-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/codegraph-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('65405dd38e97d22be13672e9f31ad0ce213dfe76e14d56a355031f80083d68a4')
sha256sums_aarch64=('0008eed047c92b1c69a13fe0e197816121fcba47603af39e7ea7d84245b5ae66')

package() {
    install -Dm755 "$srcdir/codegraph" "$pkgdir/usr/bin/codegraph"
}
