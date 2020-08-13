pkgname=distroflex
pkgver=1.0
pkgrel=1
pkgdesc="Cross-distro settings tool"
arch=('any')
url="https://github.com/AlexVIM1/distroflex"
license=('GPLv3')
optdepends=(
	'lsb-release: get kernel info'
	'xorg-xrandr: video settings'
	'lm_sensors: get CPU temperature'
	'alsa-lib: sound library'
	'alsa-utils: sound settings'
)
source=("https://raw.githubusercontent.com/AlexVIM1/distroflex/pkg/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('e9b39bbfb9213bdb32ecaa8300e2500b')
build() {
    cd "${srcdir}/build"
    qmake
    make
}
package() {
    	cd "${srcdir}/build"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -Dm755 distroflex "${pkgdir}/usr/bin"
	install -Dm755 res/distroflex-icon.png "${pkgdir}/usr/share/pixmaps"
	install -Dm755 res/distroflex.desktop "${pkgdir}/usr/share/applications"
}

