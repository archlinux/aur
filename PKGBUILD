# Maintainer: jim945 [at] mail . r [u]
# Maintainer: clebermathes (clebermatheus@outlook.com)

pkgname='dynfilefs'
pkgdesc='Fuse filesystem for dynamically-enlarged file (to be mounted as loop)'
pkgver=5.01
pkgrel=1
url='https://github.com/Tomas-M/dynfilefs'
arch=('x86_64')
license=('GPL3')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tomas-M/dynfilefs/archive/refs/tags/dynfilefs-v${pkgver}.tar.gz")
sha256sums=('cf178bba0e82da7e2b8119fa846c38fea16b7819ae2305ec84e5dde051c28f76')

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

