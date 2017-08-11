pkgname=libgwavi-git
pkgver=r46.ac72de4
pkgrel=1
pkgdesc=""
arch=('x86_64' 'i686')
url="https://github.com/Rolinh/libgwavi"
license=('BSD')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('libgwavi::git+https://github.com/Rolinh/libgwavi')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
        install -d $pkgdir/usr/include
        install -Dm644 inc/gwavi.h $pkgdir/usr/include/

        install -d $pkgdir/usr/lib/
        cp -r lib/* $pkgdir/usr/lib/
}
