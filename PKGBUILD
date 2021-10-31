# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="OBS filter plugin to make a source scale reactively to sound"
arch=("x86_64")
url="https://github.com/Qufyy/obs-scale-to-sound"
license=("GPL2")
depends=("obs-studio>=24.0.0")
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/obs-${_pluginname}-${pkgver}-linux64.tar.gz"
	"https://raw.githubusercontent.com/Qufyy/obs-scale-to-sound/main/LICENSE")
sha512sums=("0e230200029465bd050e11b09b1a41efc5fac188d5439309622ab0fbd1839e7a10e40f4f3400e4b6eca6a9f5d6f8d290187272470de785ef9e2d22bb2dc1aa5b"
	 "SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pluginname}/LICENSE"

	cd ${srcdir}/${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/

	install -Dm755 ./bin/64bit/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/
}
