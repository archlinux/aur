#Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=implot-git
pkgver=0.17.0
pkgrel=1
pkgdesc="Immediate Mode Plotting"
arch=('any')
url="https://github.com/epezent/implot"
license=('MIT')

provides=('implot')
depends=('imgui')
makedepends=('cmake')
source=("git+https://github.com/epezent/implot.git"
	'CMakeLists.txt'
)
sha256sums=('SKIP'
            '6f18ca62265b4a60ef83c899a12230e45d25d98ce3a931a3d8139a4404d9bd3f')

prepare() {
	mv CMakeLists.txt implot/
}

build() {
	cd implot
	cmake .
	cmake --build .
}

package() {
	install -dm755 ${pkgdir}/usr
	cd implot
	cmake --install . --prefix ${pkgdir}/usr
}
