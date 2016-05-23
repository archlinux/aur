# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-google-play-git
pkgver=5.14.r2.g6628efb
pkgrel=1
pkgdesc='Google Play Music integration for Nuvola Player.'
arch=('any')
url='https://github.com/tiliado/nuvola-app-google-play'
license=('custom:BSD')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-google-play.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${pkgname}"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
