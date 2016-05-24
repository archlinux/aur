# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-spotify
pkgdesc='Spotify integration for Nuvola Player 3.0'
pkgver=2.1
pkgrel=1

license=('BSD')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('b2c1fa48dd6e1386d883e7c7f05f01f9c222414cf4fd5b0b553fffd5fe14cca8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiliado/${pkgname}/archive/${pkgver}.tar.gz")
url="https://github.com/tiliado/${pkgname}"

package() {
	cd "${pkgname}-${pkgver}"

	# Optimize SVG icons (scour), generate PNG icons (lasem), build and install.
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"

	# Install all available licenses.
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE*
}
# template end;
