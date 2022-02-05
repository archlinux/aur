# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=1.1.2
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
sha512sums=("6b81f5c6d15e6e66e1af706ce87fc97b41a6d27116c2b0005a0abc79dc94bc2a49cff565a6bc0cdb8f89beab5535bfd33a16c66ecce213dcbeb0d1096f28bc48"
	    "SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pluginname}/LICENSE"

	cd ${srcdir}/${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/

	install -Dm755 ./bin/64bit/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/
}
