# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-deezer-git
pkgver=2.4.r0.gdd9c16d
pkgrel=1

arch=('any')
license=('custom:BSD')
pkgdesc='Deezer integration for Nuvola Player.'
url='https://github.com/tiliado/nuvola-app-deezer'

source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-deezer.git")
sha256sums=('SKIP')

depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
