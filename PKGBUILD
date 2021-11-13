# Maintainer: igo95862 <https://github.com/igo95862/cfs-zen-tweaks>
pkgname=cfs-zen-tweaks
pkgver=1.1.0
pkgrel=1
pkgdesc="Script tweak CFS for desktop interactivity"
arch=('any')
url="https://github.com/igo95862/cfs-zen-tweaks"
license=('GPL2')
depends=('gawk' 'bash' 'systemd')
makedepends=('cmake')
source=("${pkgname}-${pkgver}"::"https://github.com/igo95862/cfs-zen-tweaks/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9f54e64689bb68bc35a043ba70fc56efb6552cd4287f0242c4d3c2267dae46a2bce99f59140348944b58691c3c748c0c67ad7f6a72bb82face40760f59a8d3cf')

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
