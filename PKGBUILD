# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Matthew Zipkin (https://keybase.io/pinheadmz)
# Upstream: https://github.com/handshake-org/hs-client
pkgname=hs-client
pkgver=0.0.10
pkgrel=2
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
	'6cdb40a11dd25b908ea8fd7f806752bd50bffb4ef62aa621f604453910336d38'
	'SKIP'
)
validpgpkeys=('E61773CD6E01040E2F1BD78CE7E2984B6289C93A')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	node build
	node install --user root --group root --license "${pkgdir}/usr"
}
