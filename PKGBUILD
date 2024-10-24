# Maintainer: Penguin <penguin@pcland.co.in>
pkgname=wikilynx
pkgver=1.2.7
pkgrel=0
epoch=1
pkgdesc="A simple Qt C++ app to play Wikipedia Speedruns the right way"
arch=('any')
url="https://github.com/flamboyantpenguin/wikiLYNX"
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
source=("extras.tar.gz"
	"https://github.com/flamboyantpenguin/wikiLYNX/archive/refs/tags/v1.2.7.zip"
	)
sha256sums=('SKIP' 'SKIP')
validpgpkeys=()

build() {

	cd "wikilynx-${pkgver}/wikiLYNX"
	cmake .
	cmake --build .

}

package() {
		
	cd "wikilynx-${pkgver}/wikiLYNX"
	install -D "wikiLYNX" "${pkgdir}/usr/bin/wikilynx"
	install -Dm644 "${srcdir}/wikiLYNX.png" "${pkgdir}/usr/share/pixmaps/wikiLYNX.png"
	install -Dm644  "${srcdir}/wikilynx.desktop" "${pkgdir}/usr/share/applications/wikilynx.desktop"
	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/wikilynx"
	install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/wikilynx"
	install -Dm644 "../COPYING.QtWebEngine" "${pkgdir}/usr/share/licenses/wikilynx"
	install -Dm644 "../docs/license/CourierPrime_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx"
	install -Dm644 "../docs/license/NotoSans_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx"

}
