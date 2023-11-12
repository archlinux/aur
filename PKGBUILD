# Maintainer: igo95862 <https://github.com/igo95862/cfs-zen-tweaks>
pkgname=cfs-zen-tweaks
pkgver=1.3.0
pkgrel=1
pkgdesc="Script tweak CFS for desktop interactivity"
arch=('any')
url="https://github.com/igo95862/cfs-zen-tweaks"
license=('GPL2')
depends=('gawk' 'bash' 'systemd')
makedepends=('cmake')
source=("${pkgname}-${pkgver}"::"https://github.com/igo95862/cfs-zen-tweaks/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('38a1aea40a577b45cace1cb37fb8d742fbddadcb6e296836f69dc13c4f4be76915c0883f5f11ac912c055d5ad2a8056dbfcce99eea6a4bb61848528200d4fc05')

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
