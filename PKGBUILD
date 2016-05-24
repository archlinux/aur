# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-plex
pkgdesc='Plex Media integration for Nuvola Player 3.0'
pkgver=1.1
pkgrel=1

license=('BSD')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('7d26b82b1489219a22d4613bff79178a0ce4ada677a69bf7c08866ac85c253e6')
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

# GitHub releases for nuvola-app-plex are tagged v#.#.
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiliado/${pkgname}/archive/v${pkgver}.tar.gz")
