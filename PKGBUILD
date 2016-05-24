# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-soundcloud
pkgdesc='SoundCloud integration for Nuvola Player 3.0'
pkgver=1.1
pkgrel=1

license=('BSD' 'MIT' 'CCPL:by')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('bab5badce194a86efc747bffe5ddced2cdeb3ffc598cbe4b2017ae93f7de1aec')
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
