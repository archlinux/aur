# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Christopher Jeffrey (https://keybase.io/chjj)
# Upstream: https://github.com/handshake-org/hsd
pkgname=hsd
pkgver=3.0.0
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
	'ff69a6d0fefb096a5cabafe08dc2e8414da46109886b06d12b2a2447f725fa87'
	'SKIP'
)
validpgpkeys=('B4B1F62DBAC084E333F3A04A8962AB9DE6666BBD')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	node build
	node install --user root --group root --license "${pkgdir}/usr"
}
