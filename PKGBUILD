# Maintainer: Brodi <me@brodi.space>
_plugin=rtspserver
pkgname=obs-${_plugin}-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="RTSP server plugin for obs-studio"
arch=("x86_64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=("GPL")
depends=("obs-studio>=24.0.0")
provides=("${pkgname}")
conflicts=("obs-${_plugin}")
source=("https://github.com/iamscottxu/obs-rtspserver/releases/download/v${pkgver}/obs-rtspserver-v${pkgver}-linux.tar.gz"
	"https://raw.githubusercontent.com/iamscottxu/obs-rtspserver/master/LICENSE")
sha512sums=("07c7fa597717075b9831833008d66c42de55103519e347b9821c9c39c03c1b8adc1873d1889165bc1b89348a29c9da68d8b5ca3a586f93afed4a2a0267e24e7c"	 "SKIP")

package() {
	cd ${srcdir}/obs-${_plugin}-v${pkgver}-linux/
	
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/

	install -Dm755 usr/lib/x86_64-linux-gnu/obs-plugins/obs-${_plugin}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 usr/share/obs/obs-plugins/obs-rtspserver/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/obs-${_plugin}/LICENSE"
}
