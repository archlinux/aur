# Maintainer: Brodi <me@brodi.space>
_pkgname=obs-rtspserver
pkgname=${_pkgname}-bin
pkgver=2.0.6
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
sha512sums=('97f23ae81f79d92a91f32a04dddb602a61938b5da7c1a9d1105bc374fb3cadf9c1027fa6570c5f004d87421a10970acaaad0f896e85c335e8f032604d0e75853'
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
