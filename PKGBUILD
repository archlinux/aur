# Maintainer: igo95862 <https://github.com/igo95862/cfs-zen-tweaks>
pkgname=cfs-zen-tweaks
pkgver=1.2.0
pkgrel=1
pkgdesc="Script tweak CFS for desktop interactivity"
arch=('any')
url="https://github.com/igo95862/cfs-zen-tweaks"
license=('GPL2')
depends=('gawk' 'bash' 'systemd')
makedepends=('cmake')
source=("${pkgname}-${pkgver}"::"https://github.com/igo95862/cfs-zen-tweaks/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('260ff8769c97939950381f8584e67f2628516d79e4424a0e97dabce14c1b3983cf649e5829cba625cccc24dc6532246b0466d628780462f87646fa4c1d6037ca')

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
