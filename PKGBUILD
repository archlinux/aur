# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=backly
pkgver=1.12
pkgrel=1
pkgdesc="A simple directory cloner"
url="http://git.bradleylaboon.com/backly.git"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
source=($pkgname::git://git.bradleylaboon.com/$pkgname.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname/
	git describe | sed 's/^v//g'
}

build() {
	cd $pkgname/
	make
}

package() {
	make -C $pkgname DESTDIR="$pkgdir" PREFIX="/usr" install
}
