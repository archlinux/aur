# Maintainer: Aurélien Ooms <aurelien.ooms@gmail.com>
# Signature: Christopher Jeffrey (https://keybase.io/chjj)
# Upstream: https://github.com/handshake-org/hs-client
pkgname=hs-client
pkgver=0.0.9
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
	'b76d9132366eea28777d008e60f1a51e12ccc7a52b2e48df978806de1b368929'
	'SKIP'
)
validpgpkeys=('B4B1F62DBAC084E333F3A04A8962AB9DE6666BBD')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	node build
	node install --user root --group root --license "${pkgdir}/usr"
}
