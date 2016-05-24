# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-deezer-git
pkgdesc='Deezer integration for Nuvola Player 3.1'
pkgver=2.4.r0.gdd9c16d
pkgrel=1

# template start; name=nuvola-app-git; version=1.0.0;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
_gitname="${pkgname%-git}"

arch=('any')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')
license=('custom:BSD')
sha256sums=('SKIP')
source=("git+https://github.com/tiliado/${_gitname}.git")
url="https://github.com/tiliado/${_gitname}"

pkgver() {
	cd "${_gitname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_gitname}"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# template end;
