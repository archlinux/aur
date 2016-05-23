# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-owncloud-music-git
pkgver=1.1.r0.geaf6a29
pkgrel=3

arch=('any')
license=('custom:BSD' 'CCPL')
pkgdesc='OwnCloud Music integration for Nuvola Player.'
url='https://github.com/tiliado/nuvola-app-owncloud-music'

source=("$pkgname::git+https://github.com/tiliado/nuvola-app-owncloud-music.git")
sha256sums=('SKIP')

depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')


pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE-BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
