# Maintainer: Brodi <me@brodi.space>
_pkgname=obs-rtspserver
pkgname=${_pkgname}-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="RTSP server plugin for obs-studio"
arch=("x86_64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=('GPL')
depends=('obs-studio>=24.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/iamscottxu/obs-rtspserver/releases/download/v${pkgver}/obs-rtspserver-v${pkgver}-linux.tar.gz"
	"https://raw.githubusercontent.com/iamscottxu/obs-rtspserver/master/LICENSE")
sha512sums=('59e23a4ad5b51421057e41176b401a79d381039f834e7ef94680097ad959fc752fe3e4bf92e9d09bfca7d9e56a06902ed92334c219213691b789e1a8bbca9b65'
	 'SKIP')

package() {
	cd ${srcdir}/obs-rtspserver	
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	
	install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/{$pkgname}/LICENSE"
}
