# Maintainer: Maxime Tréca <maxime.treca@gmail.com>
pkgname=digraph-git
pkgver=r3.2b9a056
pkgrel=1
pkgdesc="A vim-style digraph parser."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/vxid/digraph"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=("$pkgname::git+https://github.com/vxid/digraph.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
