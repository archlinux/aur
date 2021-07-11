# Maintainer: Brodi <me@brodi.space>
_pkgname=obs-rtspserver
pkgname=${_pkgname}-bin
pkgver=2.1.0
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
sha512sums=('df43086161b3a7c57d8d1b919e7b34f229421457516f1ddb4f25136e7e3568a77b8e2ea61169c98802dca45aedc3fe121e62459f9f2fc4f8db4ce34ef33fb8ef'
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
