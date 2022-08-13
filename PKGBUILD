# Maintainer: Zee Yudenko <lubomir dot yudenko at gmail dot com>

pkgname=supercc
pkgver=2.0.2
pkgrel=1
pkgdesc="An optimization focused emulator of the game \"Chip's Challenge\"."
arch=('any')
url='https://github.com/SicklySilverMoon/SuperCC'
license=('GPL2')
depends=('java-runtime>=17')
optdepends=()
source=(
	"https://supercc.bitbusters.club/downloads/SuperCC_${pkgver}.zip"
	"https://raw.githubusercontent.com/SicklySilverMoon/SuperCC/master/LICENSE"
	"https://raw.githubusercontent.com/SicklySilverMoon/SuperCC/master/src/main/resources/icons/windowIcon.png"
	"SuperCC"
	"SuperCC.desktop")
sha256sums=('15e3060a5efe3878877e4c416531f1c5163114c58cee4bc9f717c233f299443f'
			'SKIP'
			'SKIP'
			'fb4da0254eb1ff76265c2a6aebbd81cbc6d3ea72d25f1ce2493c7b53025144a4'
			'53b95ca77cbe3a6669343ec094a306f15f02df23f5f1dff22e83138e0888ebbd')

build() {
	# There are no real build steps
	mv windowIcon.png SuperCC.png
}

package() {
    install -D -m755 "SuperCC.jar" -t "${pkgdir}/usr/share/java/supercc/"
    install -D -m755 "SuperCC" -t "${pkgdir}/usr/bin/"
    install -D -m644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "SuperCC.png" -t "${pkgdir}/usr/share/pixmaps"
    install -D -m644 "SuperCC.desktop" -t "${pkgdir}/usr/share/applications"
}
