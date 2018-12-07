# Maintainer: jim945 [at] mail . r [u]

pkgname='dynfilefs'
pkgdesc='Fuse filesystem for dynamically-enlarged file (to be mounted as loop)'
pkgver=2.2
pkgrel=1
url='https://github.com/Tomas-M/dynfilefs'
arch=('x86_64')
license=('GPL3')


source=("git+https://github.com/Tomas-M/dynfilefs")

sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
	echo "Run ./autogen.sh"
	./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname}"
	
	echo "Run ./configure"
	./configure --prefix="/usr" --bindir="/usr/bin" --sbindir="/usr/bin"
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}/" install
}
