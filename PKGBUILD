# Maintainer: Penguin <penguin@pcland.co.in>
pkgname=wikilynx
pkgver=1.5.5
pkgrel=2
#epoch=2
pkgdesc="A simple Qt C++ app to play Wikipedia Speedruns the right way"
arch=('any')
url="https://github.com/flamboyantpenguin/wikilynx"
license=('MIT')
depends=(
	'qt6-base'
	'qt6-webengine'
	'qt6-svg'
	'qt6-multimedia'
	'qt6-multimedia-gstreamer'
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
source=("https://github.com/flamboyantpenguin/wikilynx/archive/refs/tags/v1.5.5.zip")
sha256sums=('SKIP')
validpgpkeys=()

build() {

	cd "wikilynx-${pkgver}/wikiLYNX"
	cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr .
	make
}

package() {
	
	cd "wikilynx-${pkgver}/wikiLYNX"
	#make install
	install -D "wikilynx" "${pkgdir}/usr/bin/wikilynx"
	install -Dm644 "../docs/desktop/in.org.dawn.wikilynx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/in.org.dawn.wikilynx.svg"
	install -Dm644 "../docs/desktop/wikilynx.desktop" "${pkgdir}/usr/share/applications/wikilynx.desktop"
	install -Dm644 "../docs/desktop/in.org.dawn.wikilynx.appdata.xml" "${pkgdir}/usr/share/metainfo/in.org.dawn.wikilynx.appdata.xml"
	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/wikilynx/LICENSE"
	install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/wikilynx/COPYING"
	install -Dm644 "../COPYING.QtWebEngine" "${pkgdir}/usr/share/licenses/wikilynx/COPYING.QtWebEngine"
	install -Dm644 "../docs/license/Comfortaa_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx/Comfortaa_OFL.txt"
	install -Dm644 "../docs/license/CourierPrime_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx/CourierPrime_OFL.txt"
	install -Dm644 "../docs/license/NotoSans_OFL.txt" "${pkgdir}/usr/share/licenses/wikilynx/NotoSans_OFL.txt"
	install -Dm644 "../docs/license/LICENSE-MaterialIcons.txt" "${pkgdir}/usr/share/licenses/wikilynx/LICENSE-MaterialIcons.txt"

}
