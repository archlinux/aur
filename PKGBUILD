# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-tunein
pkgdesc='TuneIn integration for Nuvola Player 3.0'
pkgver=1_0
pkgrel=1

license=('BSD' 'CCPL:by')

# template start; name=nuvola-app; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

arch=('any')
depends=('nuvolaplayer')
makedepends=('lasem' 'scour')
sha256sums=('9a05b3075de77a0da835df7fc49fb0bb4492dfb0d2ec4d7ca33bd65a526ec8d3')
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
