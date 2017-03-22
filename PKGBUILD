# Maintainer: Frantisek Fladung

_pkgname=stest
pkgname=$_pkgname-git
pkgver=4.f2676b4
pkgrel=1
pkgdesc="filter files by properties - ametisf fork"
url="https://github.com/ametisf/stest"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh')
makedepends=('git' 'tup')
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
	mkdir -p $pkgdir/usr/bin
	install -m 755 stest $pkgdir/usr/bin
}
