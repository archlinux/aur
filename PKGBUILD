# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-logitech-media-server
pkgdesc='Logitech Media Server integration for Nuvola Player 3.0'
pkgver=2.0
pkgrel=1

license=('BSD' 'CCPL:by')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('8670377d6c703079f690e5000ba9c058e7878dab7f19be4c6c766326b205d407')
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
