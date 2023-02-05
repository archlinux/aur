# Maintainer: jim945 [at] mail . r [u]
# Maintainer: clebermathes (clebermatheus@outlook.com)

pkgname='dynfilefs'
pkgdesc='Fuse filesystem for dynamically-enlarged file (to be mounted as loop)'
pkgver=3.00
pkgrel=1
url='https://github.com/Tomas-M/dynfilefs'
arch=('x86_64')
license=('GPL3')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tomas-M/dynfilefs/archive/refs/tags/dynfilefs-v${pkgver}.tar.gz")
sha256sums=('cc93cb193fc28e2d3c16cc7dd33b5f66101f76c03f09172d8cc638cf605baf2f')

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

