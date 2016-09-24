# Maintainer: Carlos Franke <carlos_franke at lemtank dot de>
_pkgname=abbrase
pkgname=$_pkgname-git
pkgver=r41.3834b28
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/rmmh/abbrase"
license=('custom')
depends=()
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/rmmh/abbrase.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
