# Maintainer: Dario Spinnato <dario.spinnato07@gmail.com>
# Contributor: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=1.2.5
pkgrel=2
pkgdesc="OBS filter plugin to make a source scale reactively to sound"
arch=("x86_64")
url="https://github.com/Qufyy/obs-scale-to-sound"
license=("GPL2")
depends=("obs-studio>=24.0.0")
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/${_pluginname}-${pkgver}-x86_64-linux-gnu.tar.gz")

sha512sums=('f289aec6b62e33d337f4de991c50b738ff95b7720d80596ec1c2292b5174130234fc332ff38d7c94f8bd0efe3f44793c963002770dd147d015aa5bb897301512')

package() {
	cd ${srcdir}/${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/

	install -Dm755 ./bin/64bit/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/
}
