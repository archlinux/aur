# Maintainer: davedatum <ask at davedatum dot com>

pkgname=heimer
pkgver=1.11.0
pkgrel=1
pkgdesc="simple cross-platform mind map and note-taking tool written in Qt."
arch=("any")
url="https://github.com/juzzlin/heimer"
license=("GPL3")
depends=("qt5-tools")
makedepends=("git" "cmake")
source=("heimer::git+$url.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
}