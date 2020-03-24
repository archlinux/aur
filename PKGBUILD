# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=backly
pkgver=1.40
pkgrel=1
pkgdesc="A simple directory cloner"
url="http://git.bradleylaboon.com/backly.git"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
source=($pkgname::git+https://git.bradleylaboon.com/lb.laboon/$pkgname.git#tag=v${pkgver})
sha256sums=('SKIP')

build() {
	cd $pkgname/
	make
}

package() {
	make -C $pkgname DESTDIR="$pkgdir" PREFIX="/usr" install
}
