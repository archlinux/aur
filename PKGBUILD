# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="filepacker"
pkgname="filepacker"
pkgrel=1
pkgver=0.0.2
pkgdesc="Packs groups of n files in folders"
arch=("any")
makedepends=()
depends=()
license=("GPL")
source=('https://github.com/DisableGraphics/Filepacker/archive/refs/tags/v0.0.2.tar.gz')
sha512sums=('ddfaba0eee2b4e41e48c8c015c30c64c193e44ae87a88b35b033ef7b800bb66adbac2f4cf44f10d8fe5f662cf85045226aa355332e54d575af9336dc93ebd187')
prepare() {
	tar xf v${pkgver}.tar.gz
	cd ${srcdir}/Filepacker-${pkgver}
	make -j$(nproc)
}
package() {
	mkdir -p "${pkgdir}/usr/"
	mkdir -p "${pkgdir}/usr/bin/"
	cp "${srcdir}/Filepacker-${pkgver}/filepacker" "${pkgdir}/usr/bin/filepacker"
}

