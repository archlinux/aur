pkgname=smpeg-git
pkgver=2.0.0_r366.c5793e5
pkgrel=2
pkgdesc="SDL MPEG Player Library"
arch=(x86_64 aarch64)
url=https://icculus.org/smpeg/
license=(LGPL)
depends=(sdl2)
provides=(smpeg2)
conflicts=(smpeg)
source=(git+https://github.com/icculus/smpeg.git)
md5sums=(SKIP)
pkgver(){
	cd smpeg
	echo 2.0.0_r`git rev-list --count HEAD`.`git rev-parse --short HEAD`
}
build(){
	cd smpeg
	./autogen.sh
	./configure --p /usr
	make
}
package(){
	cd smpeg
	make DESTDIR="$pkgdir" install
}
