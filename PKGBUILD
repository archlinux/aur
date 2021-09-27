# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="OBS filter plugin to make a source scale reactively to sound"
arch=("x86_64")
url="https://github.com/Qufyy/obs-scale-to-sound"
license=("GPL2")
depends=('obs-studio>=24.0.0')
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/obs-${_pluginname}-${pkgver}-linux64.tar.gz"
	"https://raw.githubusercontent.com/Qufyy/obs-scale-to-sound/main/LICENSE")
sha512sums=("142db5b6442dec704fa87e7fe0f74227bdffab41612cc1010d996ba04fdfbfae82a323d1131de3baac827393b6d13e0de6f28390b3b1c8d09aad507a6c2b9012"
	 'SKIP')

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/obs-${_pluginname}/LICENSE"

	cd ${srcdir}/obs-${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-${_pluginname}/

	install -Dm755 ./bin/64bit/obs-${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/obs-${_pluginname}/
}
