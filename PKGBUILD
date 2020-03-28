# Maintainer: fardragon <michaldrozd@protonmail.ch>

pkgname=imgui-sfml
pkgver=2.1
pkgrel=1
pkgdesc="Library which allows you to use ImGui with SFML"
arch=("any")
url="https://github.com/eliasdaler/imgui-sfml/"
license=("MIT")
source=("https://github.com/eliasdaler/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("6e7fc0bd05372e668c786f7e25591302")
depends=("sfml" "imgui-src")
makedepends=("cmake")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DBUILD_SHARED_LIBS=ON -DIMGUI_DIR=/opt/imgui .
	cmake --build .
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake --build . --target install
}
