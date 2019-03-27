# Maintainer: Jaco Malan <jacomalan.12@gmail.com>
pkgname=stress++
pkgver=0.1.2
pkgrel=1
license=('GPL')
arch=('any')

prepare() {

	git clone https://github.com/Code-Log/stress-plus-plus.git $srcdir
	mkdir -p $srcdir/build

}

build() {

	cd $srcdir/build
	cmake .. -DCMAKE_BUILD_TYPE=Debug
	make $MAKEFLAGS

}

package() {

	cd $srcdir/build
	make DESTDIR="$pkgdir" install

}
