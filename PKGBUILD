# Maintainer: Brodi <me@brodi.space>
_plugin=rtspserver
pkgname=obs-${_plugin}-bin
pkgver=2.2.1
pkgrel=2
pkgdesc="RTSP server plugin for obs-studio"
arch=("x86_64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=("GPL")
depends=("obs-studio>=24.0.0")
provides=("${pkgname}")
conflicts=("obs-${_plugin}")
source=("https://github.com/iamscottxu/obs-rtspserver/releases/download/v${pkgver}/obs-rtspserver-v${pkgver}-linux.tar.gz"
	"https://raw.githubusercontent.com/iamscottxu/obs-rtspserver/master/LICENSE")
sha512sums=("d151a65adfde2826c7dd99e5af375fc74f96b01042477a2387bd4baaa6201e5d59c2a9ba64c361450b6163530b7651e5ec473435afd8faba490cd44d7a25a4ae"	 "SKIP")

package() {
	cd ${srcdir}/obs-${_plugin}-v${pkgver}-linux/
	
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	
	install -Dm755 usr/lib/obs-plugins/obs-${_plugin}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 usr/share/obs/obs-plugins/obs-${_plugin}/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/obs-${_plugin}/LICENSE"
}
