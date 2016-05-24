# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-google-play-music-git
pkgdesc='Google Play Music integration for Nuvola Player 3.1'
pkgver=5.14.r2.g6628efb
pkgrel=1

# Old (non-upstream) package name.
provides=('nuvola-app-google-play-git')
replaces=('nuvola-app-google-play-git')

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
