# Maintainer: jim945 [at] mail . r [u]
# Maintainer: clebermathes (clebermatheus@outlook.com)

pkgname='dynfilefs'
pkgdesc='Fuse filesystem for dynamically-enlarged file (to be mounted as loop)'
pkgver=4.03
pkgrel=1
url='https://github.com/Tomas-M/dynfilefs'
arch=('x86_64')
license=('GPL3')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tomas-M/dynfilefs/archive/refs/tags/dynfilefs-v${pkgver}.tar.gz")
sha256sums=('d1df889f457991aa26d3a8a8cf570982f3aa8601f0fcb57a056476f1233dd7aa')

prepare() {
	cd "${pkgname}-${pkgver}"
	echo "Run ./autogen.sh"
	./autogen.sh
}

build() {
	cd "${pkgname}-${pkgver}"

	echo "Run ./configure"
	./configure --prefix="/usr" --bindir="/usr/bin" --sbindir="/usr/bin"

	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

