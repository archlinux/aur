# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.1
pkgrel=2
pkgdesc="Library which allows you to use ImGui with SFML"
arch=("any")
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz"
		"https://github.com/ocornut/imgui/archive/v1.78.tar.gz")
md5sums=("6e7fc0bd05372e668c786f7e25591302"
		"4104b4f2788c94a776c3015699e83d20")
depends=("sfml")
makedepends=("cmake")

imguiver=1.78

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DBUILD_SHARED_LIBS=ON -DIMGUI_DIR=${srcdir}/imgui-${imguiver} .
	cmake --build .
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake --build . --target install
}
