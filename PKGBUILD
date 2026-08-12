# Maintainer: Umar Alfarouk <medrivia@gmail.com>

# NOTE: This package produces schema warnings on startup:
#   "unknown format uint64/uint32/int32 ignored in schema"
#   These come from rmcp/schemars generating non-standard JSON Schema
#   format values for Rust integer types in tool input schemas.
#   The warnings are harmless (tools work correctly) but cannot be
#   suppressed without patching upstream source, which is deferred.

_pkgname=tmux-mcp-rs
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="A Model Context Protocol (MCP) server for tmux, written in Rust (binary release)"
url="https://github.com/bnomei/tmux-mcp"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('tmux')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('077d138387dd107179fec3cefab95ced64f27c20845d014488fc542c4093c962')
sha256sums_x86_64=('6d2042b74bb1f35ef6e274a15d72a99a621fcd178c26367ed076dfd92dba786d')
sha256sums_aarch64=('7afd734bbec5dc825031c94181ae944bd5511c574967bae5e8f0a694db0607d9')
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")

package() {
	install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
