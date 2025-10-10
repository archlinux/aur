# Maintainer: jim945 [at] mail . r [u]
# Maintainer: clebermathes (clebermatheus@outlook.com)

pkgname='dynfilefs'
pkgdesc='Fuse filesystem for dynamically-enlarged file (to be mounted as loop)'
pkgver=4.04
pkgrel=1
url='https://github.com/Tomas-M/dynfilefs'
arch=('x86_64')
license=('GPL3')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tomas-M/dynfilefs/archive/refs/tags/dynfilefs-v${pkgver}.tar.gz")
sha256sums=('e29baac14439113d12839327c1f9fec27a7d36ac7e2b27580572aec6de5a0a03')

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

