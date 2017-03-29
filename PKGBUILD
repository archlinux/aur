# Maintainer: StevenDeFacto <srbatchelor@ovgl.org>
pkgname=zsurf-webkit-git
_pkgname=${pkgname%-*}
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra lightweight web browser in the spirit of Surf using QtWebKit1 with front-end logic written in Javascript."
arch=('i686' 'x86_64')
url="https://github.com/SteveDeFacto/zsurf/tree/zsurf-webkit"
license=('GPL3')
makedepends=('git')
depends=('qt5-webkit-ng')
provides=('zsurf=$pkgver')
conflicts=('zsurf-git')

source=("git+https://github.com/SteveDeFacto/zsurf/tree/zsurf-webkit.git")

build() {
	cd zsurf
	qmake
	make
}

package() {
	cd zsurf
	make INSTALL_ROOT="$pkgdir" install
}
md5sums=('SKIP')
