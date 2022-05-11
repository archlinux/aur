# Maintainer: Brodi <me@brodi.space>
_pkgname=obs-rtspserver
pkgname=${_pkgname}-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="RTSP server plugin for obs-studio"
arch=("x86_64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=("GPL")
depends=("obs-studio>=24.0.0")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/iamscottxu/obs-rtspserver/releases/download/v${pkgver}/obs-rtspserver-v${pkgver}-linux.tar.gz"
	"https://raw.githubusercontent.com/iamscottxu/obs-rtspserver/master/LICENSE")
sha512sums=("d151a65adfde2826c7dd99e5af375fc74f96b01042477a2387bd4baaa6201e5d59c2a9ba64c361450b6163530b7651e5ec473435afd8faba490cd44d7a25a4ae"	 "SKIP")

package() {
	cd ${srcdir}/obs-rtspserver	
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	
	install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
