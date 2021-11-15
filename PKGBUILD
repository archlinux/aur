# Maintainer: igo95862 <https://github.com/igo95862/cfs-zen-tweaks>
pkgname=cfs-zen-tweaks
pkgver=1.1.1
pkgrel=1
pkgdesc="Script tweak CFS for desktop interactivity"
arch=('any')
url="https://github.com/igo95862/cfs-zen-tweaks"
license=('GPL2')
depends=('gawk' 'bash' 'systemd')
makedepends=('cmake')
source=("${pkgname}-${pkgver}"::"https://github.com/igo95862/cfs-zen-tweaks/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8a7deb3598a8453a69779ae11b948bab11da31c3549a94a7a3856f7c4f6ea94abf16899012205b4250cf43503f1371a556bc0404d5ce4042b55c159c65aa274c')

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
