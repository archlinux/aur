# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
pkgname=ttf-winky-sans
pkgver=1.205
pkgrel=3
pkgdesc="A sans-serif typeface by typofactur inspired by Microsoft Comic Sans" 
arch=('any')
url="https://github.com/typofactur/winkysans"
license=('OFL-1.1-no-RFN')
makedepends=('git' 'python' 'cairo')
source=("git+${url}#commit=c5e3734")
sha256sums=('SKIP')

build() {
	cd winkysans
	make build
}

package() {
	install -Dm644 winkysans/fonts/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/WinkySans/"
	install -Dm644 winkysans/OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
