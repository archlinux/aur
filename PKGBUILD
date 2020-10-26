pkgname=distroflex
pkgver=1.0
pkgrel=2
pkgdesc="Cross-distro settings tool"
arch=('any')
url="https://github.com/AlexVIM1/distroflex"
license=('GPLv3')
makedepends=('qt5-base')
optdepends=(
	'lsb-release: get kernel info'
	'xorg-xrandr: video settings'
	'lm_sensors: get CPU temperature'
	'alsa-lib: sound library'
	'alsa-utils: sound settings'
)
source=("https://github.com/AlexVIM1/distroflex/raw/master/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('80ab03cff3137f786d70564eceb3cbc0')
build() {
	cd "${srcdir}"
    qmake
    make
}
package() {
    cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -Dm755 distroflex "${pkgdir}/usr/bin"
	install -Dm755 res/distroflex-icon.png "${pkgdir}/usr/share/pixmaps"
	install -Dm755 res/distroflex.desktop "${pkgdir}/usr/share/applications"
}

