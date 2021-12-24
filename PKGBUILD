# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="OBS filter plugin to make a source scale reactively to sound"
arch=("x86_64")
url="https://github.com/Qufyy/obs-scale-to-sound"
license=("GPL2")
depends=("obs-studio>=24.0.0")
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/obs-${_pluginname}-${pkgver}-linux64.tar.gz"
	"https://raw.githubusercontent.com/Qufyy/obs-scale-to-sound/main/LICENSE")
sha512sums=("e9300763de771170eedfb64fd6c1452670f8b77c6100fc83274b4820db90b6f1113e4525675498bed14b01f55b92651a01170f03e409233e3f83b433c9fe4523"
	 "SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pluginname}/LICENSE"

	cd ${srcdir}/${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/

	install -Dm755 ./bin/64bit/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/
}
