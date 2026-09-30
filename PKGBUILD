# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=4.0.0
pkgrel=1
pkgdesc='Long-term memory MCP server for AI agents with deterministic root-cause retrieval'
arch=('x86_64')
url='https://github.com/samvallad33/vestige'
license=('AGPL-3.0')
depends=('glibc' 'gcc-libs')
provides=('vestige')
conflicts=('vestige' 'vestige-git')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-mcp-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c7df3f70ed593b01f7e64b5d02fbcdcb93a9db07925c1806f7f606ef76f03797')

package() {
    install -Dm755 "$srcdir/${_pkgname}-mcp" "$pkgdir/usr/bin/${_pkgname}-mcp"
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm755 "$srcdir/${_pkgname}-restore" "$pkgdir/usr/bin/${_pkgname}-restore"
}
