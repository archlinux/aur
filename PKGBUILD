# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Matthew Zipkin (https://keybase.io/pinheadmz)
# Upstream: https://github.com/handshake-org/hs-client
pkgname=hs-client
pkgver=0.0.11
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Handshake daemon node and wallet client"
url="https://handshake.org"
depends=(
	'nodejs'
)
makedepends=(
	'node-gyp'
)
provides=(
	'hsd-cli'
	'hsd-rpc'
	'hsw-cli'
	'hsw-rpc'
)
source=(
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz"
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=(
	'3852296b992e0e9ab61017fc46b59fc570017cefe0d5b5d23822fd4d1391feb7'
	'SKIP'
)
validpgpkeys=('E61773CD6E01040E2F1BD78CE7E2984B6289C93A')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	node build
	node install --user root --group root --license "${pkgdir}/usr"
}
