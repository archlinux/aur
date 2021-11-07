# Maintainer: igo95862 <https://github.com/igo95862/cfs-zen-tweaks>
pkgname=cfs-zen-tweaks
pkgver=1.0.0
pkgrel=1
pkgdesc="Script tweak CFS for desktop interactivity"
arch=('any')
url="https://github.com/igo95862/cfs-zen-tweaks"
license=('GPL2')
depends=('gawk' 'bash' 'systemd')
makedepends=('cmake')
source=("${pkgname}-${pkgver}"::"https://github.com/igo95862/cfs-zen-tweaks/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d72f5df3cd16a224ab88b2356765e528ee050ac70260261282cdef45d6d7c906514c6f01a63e1d785e341c9971d39f115e772f6df0484f369c0d04d8d43324c1')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	make -C build
}


package() {
	DESTDIR="$pkgdir/" cmake --install build
}
