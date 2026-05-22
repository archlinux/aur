# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=codegraph-rs-bin
pkgver=0.1.0
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

sha256sums_x86_64=('6a12c2d56028c227f99ecfac494f9bd7c0378074204f5b7e56e737593d4819eb')
sha256sums_aarch64=('8e380776eacc36defb3577d3ad3e5df76a0135b59343f93a28cb862b1e24524a')

package() {
    install -Dm755 "$srcdir/codegraph" "$pkgdir/usr/bin/codegraph"
}
