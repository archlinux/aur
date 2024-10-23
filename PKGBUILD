#im so sorry for this warcrime of a pkgbuild
pkgname=yoaur
pkgver=1.2.3
pkgrel=1
epoch=1
pkgdesc="An AUR helper written in C++"
arch=("x86_64")
url="https://github.com/thedenzellight/yo"
license=('MIT')
makedepends=("git" "base-devel" "cmake")
provides=("yo")
prepare() {
	git clone $url.git 
}

build() {
	cd yo
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	sudo install yo/build/yo /usr/bin/
}
