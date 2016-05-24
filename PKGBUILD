# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-bandcamp
pkgdesc='Bandcamp integration for Nuvola Player 3.0'
pkgver=2.1
pkgrel=2

license=('BSD')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('89e3a75492250ad1f072490a22bce3680cb513cff3f0c14afb6c1cd53e8ff6c8')
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
