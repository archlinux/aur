# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-mixcloud
pkgdesc='Mixcloud integration for Nuvola Player 3.0'
pkgver=3.0
pkgrel=1

license=('BSD')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('e4ccf662a85e793a07ccc4380eb6e69c2dd1e36f94d31a0c72f25764435c9e29')
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
