# Maintainer: Brodi <me@brodi.space>
_pkgname=obs-rtspserver
pkgname=${_pkgname}-bin
pkgver=2.1.2
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
sha512sums=("d46bd68869efaec24d316a5b23a66028c18d9f6fdfcc1d42e1d88d43af577c1e00f32a22c83513c36d6be7ca0eb2bb4aa5e56ef34e5a0da869794b3b9ded7b21"	 "SKIP")

package() {
	cd ${srcdir}/obs-rtspserver	
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	
	install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/locale/* ${pkgdir}/usr/share/obs/obs-plugins/obs-rtspserver/locale/
	install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
