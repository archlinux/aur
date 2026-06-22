# Maintainer: Umar Alfarouk <medrivia@gmail.com>

# NOTE: This package produces schema warnings on startup:
#   "unknown format uint64/uint32/int32 ignored in schema"
#   These come from rmcp/schemars generating non-standard JSON Schema
#   format values for Rust integer types in tool input schemas.
#   The warnings are harmless (tools work correctly) but cannot be
#   suppressed without patching upstream source, which is deferred.

_pkgname=tmux-mcp-rs
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc="A Model Context Protocol (MCP) server for tmux, written in Rust (binary release)"
url="https://github.com/bnomei/tmux-mcp"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('tmux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f1f88bafbbcb4fffce84539dd7cc8c4d2a6adc5a46d9892fe9dd3961db746b0f')
sha256sums_aarch64=('7aecc33bbb7c4a37c0a3896d0a248a64a27e59fc142ecd3393a2ec9397c9a2dd')
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('077d138387dd107179fec3cefab95ced64f27c20845d014488fc542c4093c962')

package() {
	install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
