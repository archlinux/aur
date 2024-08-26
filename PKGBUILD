# Maintainer: L. Bradley LaBoon <brad@laboon.io>
pkgname=backly
pkgver=1.40
pkgrel=1
pkgdesc="A simple directory cloner"
url="https://laboon.dev/brad/backly"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
source=($pkgname::git+https://laboon.dev/brad/backly.git#tag=v${pkgver})
sha256sums=('SKIP')

build() {
	cd $pkgname/
	make
}

package() {
	make -C $pkgname DESTDIR="$pkgdir" PREFIX="/usr" install
}
