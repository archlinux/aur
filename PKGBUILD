# Maintainer: Marcin Mielniczuk <marmistrz@inboxalias.com>
pkgname=cbvike
pkgver=0.2.1
pkgrel=5
pkgdesc="VIM plugin for Code::Blocks "
arch=("x86_64" "i686")
url="http://forums.codeblocks.org/index.php?topic=19281.0"
makedepends=("cmake" "codeblocks")
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
	install -Dm755 libcbVike.so "$pkgdir/usr/lib/codeblocks/plugins/libcbVike.so"
	install -Dm664 cbVike.zip "$pkgdir/usr/share/codeblocks/cbVike.zip"
}

