# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=3.1.1
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
sha256sums_x86_64=('6b698908cb33b1827d6a75715c7b7c949dae0dc190fc8719114bac24d9e21991')

package() {
    install -Dm755 "$srcdir/${_pkgname}-mcp" "$pkgdir/usr/bin/${_pkgname}-mcp"
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm755 "$srcdir/${_pkgname}-restore" "$pkgdir/usr/bin/${_pkgname}-restore"
}
