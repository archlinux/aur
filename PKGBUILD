# Maintainer: Penguin <penguin@pcland.co.in>
pkgname=wikilynx
pkgver=1.2.8
pkgrel=1
#epoch=2
pkgdesc="A simple Qt C++ app to play Wikipedia Speedruns the right way"
arch=('any')
url="https://github.com/flamboyantpenguin/wikilynx"
license=('MIT')
depends=(
	'qt6-webengine'
)
makedepends=(
	'cmake'
	'git'
	'base-devel'
)
#optdepends=()
conflicts=("${pkgname}")
provides=("${pkgname}")
#changelog=
source=("https://github.com/flamboyantpenguin/wikiLYNX/archive/refs/tags/v1.2.8.zip")
sha256sums=('SKIP')
validpgpkeys=()

build() {

	cd "wikilynx-${pkgver}/wikiLYNX"
	cmake .
	cmake --build .

}

package() {
		
	cd "wikilynx-${pkgver}/wikiLYNX"
	install -D "wikilynx" "${pkgdir}/usr/bin/wikilynx"
	install -Dm644 "./assets/images/wikiLYNX_logo.png" "${pkgdir}/usr/share/pixmaps/wikiLYNX_logo.png"
	install -Dm644  "./assets/desktop/wikilynx.desktop" "${pkgdir}/usr/share/applications/wikilynx.desktop"
	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/wikilynx/LICENSE"
	install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/wikilynx/COPYING"
	install -Dm644 "../COPYING.QtWebEngine" "${pkgdir}/usr/share/licenses/wikilynx/COPYING.QtWebEngine"
	install -Dm644 "../docs/license/CourierPrime_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx/CourierPrime_OFL.txt"
	install -Dm644 "../docs/license/NotoSans_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx/NotoSans_OFL.txt"

}
