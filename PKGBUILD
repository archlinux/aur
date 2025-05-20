# Maintainer: Charlotte (Github: charlottecross1998)
# Comment: Alter your makefile to include -I /usr/include/corange
pkgname=corange-git
pkgver=0.8.0
pkgrel=1.0
pkgdesc="Pure C Game Engine"
arch=("x86_64")
url="https://github.com/orangeduck/Corange"
license=("BSD-2-Clause")
makedepends=("git" "make" "sdl2" "sdl2_net" "sdl2_mixer")
source=("git+https://github.com/orangeduck/Corange.git")
b2sums=('SKIP')
build()
{
	cd Corange
	make
}
package()
{
	mkdir -p $pkgdir/usr/include/corange
	mkdir -p $pkgdir/usr/lib/
	cp -r $srcdir/Corange/include/* $pkgdir/usr/include/corange
	cp $srcdir/Corange/libcorange.so $pkgdir/usr/lib/
}
