# Maintainer: crasm <crasm@vczf.io>

pkgname=lily-git
pkgver=git
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('any')
url="https://jesserayadkins.github.io/lily/"
license=('MIT')
makedepends=('git' 'cmake')
provides=('lily')
conflicts=('lily')
source=("git+https://github.com/jesserayadkins/lily.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/lily"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/lily"
}

build() {
	cd "$srcdir/lily"
	cmake .
	make
}

package() {
	cd "$srcdir/lily"
	make DESTDIR="$pkgdir/" install
}

# vim: noet nowrap tw=120
