# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=silluq-git
pkgver=VERSION
pkgrel=1
pkgdesc="Tool for simply versifying markdown urtext and checking citation completion"
arch=('i686' 'x86_64')
url="https://github.com/Beacon515L/silluq"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=("silluq-git")
conflicts=("silluq")
source=('git+https://github.com/Beacon515L/silluq.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/silluq"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/silluq"
	cmake .
	make
	chmod +x silluq
}

package() {
	cd "$srcdir/silluq"
	mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/bin/"
	cp silluq "$pkgdir/usr/bin/"
}
