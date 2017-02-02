# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-amazon-cloud-player
pkgdesc='Amazon Cloud Player integration for Nuvola Player 3.0'
pkgver=5.2
pkgrel=1

license=('BSD')

arch=('any')
conflicts=('nuvola-app-amazon-cloud-player-git')
depends=('nuvolaplayer>=3' 'nuvolaplayer<4')
makedepends=('lasem' 'scour')
sha256sums=('9730e6df2110efd740284882e00faa725d81f4345740cc2d3913cff31fb40ffb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz")
url="https://github.com/tiliado/${pkgname}"

package() {
	cd "${pkgname}-${pkgver}"

	# Optimize SVG icons (scour), generate PNG icons (lasem), build and install.
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"

	# Install all available licenses.
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE*
}
