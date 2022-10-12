# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: DisableGraphics elchifladod@gmail.com
pkgbase="filepacker"
pkgname="filepacker"
pkgrel=2
pkgver=0.0.2
pkgdesc="Packs groups of n files in folders"
arch=('any')
url="https://github.com/DisableGraphics/Filepacker"
license=('GPL')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ddfaba0eee2b4e41e48c8c015c30c64c193e44ae87a88b35b033ef7b800bb66adbac2f4cf44f10d8fe5f662cf85045226aa355332e54d575af9336dc93ebd187')

build() {
	cd ${pkgname^}-${pkgver}
	make -j$(nproc)
}

package() {
	install -Dm755 ${pkgname^}-${pkgver}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}


