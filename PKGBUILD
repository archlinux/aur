# Maintainer: Marcin Mielniczuk <marmistrz@inboxalias.com>
pkgname=cbvike
pkgver=0.2.1
pkgrel=2
pkgdesc="VIM plugin for Code::Blocks "
arch=("x86_64" "i686")
url="http://forums.codeblocks.org/index.php?topic=19281.0"
depends=("codeblocks")
# using ulrichard's CMakeLists.txt - it's the only change he made
source=("git://github.com/marmistrz/$pkgname.git")
md5sums=("SKIP")

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/cbvike/build"
	install -Dm664 libcbVike.so "$pkgdir/usr/lib/codeblocks/plugins/libcbVike.so"
}

