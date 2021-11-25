# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Matthew Zipkin (https://keybase.io/pinheadmz)
# Upstream: https://github.com/handshake-org/hsd
pkgname=hsd
pkgver=3.0.0
pkgrel=2
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
	'ff69a6d0fefb096a5cabafe08dc2e8414da46109886b06d12b2a2447f725fa87'
	'SKIP'
)
validpgpkeys=('E61773CD6E01040E2F1BD78CE7E2984B6289C93A')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	node build
	node install --user root --group root --license "${pkgdir}/usr"
}
