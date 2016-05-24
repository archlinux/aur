# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-google-calendar
pkgdesc='(Experimental) Google Calendar integration for Nuvola Player 3.0'
pkgver=1.1
pkgrel=1

license=('BSD' 'CCPL:by')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('0aafa9f441c5b7bcd6594a09efee79ecd963c50254b360c64616b0652ac7b933')
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
