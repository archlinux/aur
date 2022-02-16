# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=1.2.0
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
sha512sums=("7bf1abf3ea45a378d63b45447a4c0a775a547521b1ba07aa33f282bea7022c728bbdeed02ca9cd0ad87e81a2a7c416114ed3cb2ee796f145eafa28254a349c59"
	    "SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pluginname}/LICENSE"

	cd ${srcdir}/${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/

	install -Dm755 ./bin/64bit/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/
}
