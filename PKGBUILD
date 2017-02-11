# Maintainer: Frantisek Fladung

_pkgname=dmenu
pkgname=$_pkgname-ametisf-git
pkgver=552.e344050
pkgrel=1
pkgdesc="Wayland port of dmenu - ametisf fork"
url="https://github.com/ametisf/dmenu"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'wld')
makedepends=('git' 'libx11' 'swc' 'tup')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/ametisf/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build(){
	cd $_pkgname
	tup init
	tup upd
}

package() {
	cd $_pkgname
	PREFIX=/usr DESTDIR=$pkgdir ./install.sh
}
