# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Matthew Zipkin (https://keybase.io/pinheadmz)
# Upstream: https://github.com/handshake-org/hsd
pkgname=hsd
pkgver=4.0.1
pkgrel=1
arch=(any)
license=('MIT')
pkgdesc="Handshake daemon node"
url="https://handshake.org"
depends=(
	'nodejs'
)
makedepends=(
	'node-gyp'
)
provides=(
	'hsd'
	'hsd-node'
	'hsd-spvnode'
	'hs-seeder'
	'hs-wallet'
	'hsd-cli'
	'hsw-cli'
)
source=(
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz"
	"https://handshake.org/files/${pkgname}-${pkgver}.tar.gz.asc"
)
sha256sums=(
	'7d5ca7be4068d4ee3c737ccc8e6c62a7bbeb7d69e0dbc100612e65e090190c55'
	'SKIP'
)
validpgpkeys=('E61773CD6E01040E2F1BD78CE7E2984B6289C93A')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	node build
	node install --user root --group root --license "${pkgdir}/usr"
}
