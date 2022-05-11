# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=1.2.1
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
sha512sums=("459efae3e1effe773349532346310fde8b7bc93ae6b81f1c204e24d44b3deb386c07cdc77fafbafcf580d02bda542ef5b1790c73abbc40a8cb3e406feb41f601"
	    "SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pluginname}/LICENSE"

	cd ${srcdir}/${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/

	install -Dm755 ./bin/64bit/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/
}
