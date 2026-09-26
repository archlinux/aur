# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=3.1.0
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
sha256sums_x86_64=('fa3b2f944555cbb9d0333604a569041a38b96db803bb5d8d525a84f779430159')

package() {
    install -Dm755 "$srcdir/${_pkgname}-mcp" "$pkgdir/usr/bin/${_pkgname}-mcp"
    install -Dm755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm755 "$srcdir/${_pkgname}-restore" "$pkgdir/usr/bin/${_pkgname}-restore"
}
