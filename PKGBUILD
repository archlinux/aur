# Maintainer: Jaco Malan <jacomalan.12@gmail.com>
pkgname=stress++
pkgver=0.2.0
pkgrel=1
license=('GPL3')
arch=('any')
pkgdesc="A small, lightweight stress-testing tool for the CPU"
url="https://github.com/Code-Log/stress-plus-plus"

prepare() {

	git clone https://github.com/Code-Log/stress-plus-plus.git $srcdir
	mkdir -p $srcdir/build

}

build() {

	cd $srcdir/build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make $MAKEFLAGS

}

package() {

	cd $srcdir/build
	make DESTDIR="$pkgdir" install

}
