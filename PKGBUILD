# Maintainer: Brodi <me@brodi.space>
_pluginname=scale-to-sound
pkgname=obs-${_pluginname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="OBS filter plugin to make a source scale reactively to sound"
arch=("x86_64")
url="https://github.com/Qufyy/obs-scale-to-sound"
license=("GPL2")
depends=('obs-studio>=24.0.0')
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/obs-${_pluginname}-${pkgver}-linux64.zip"
	"https://raw.githubusercontent.com/Qufyy/obs-scale-to-sound/main/LICENSE")
sha512sums=("6acc2ded4ad6e6cdf98c5de62a4d32e63546b5c37f82bf2362ebcb94b506c4f17d23cd5f2fdc072c389732ab899bb92c80b935b3efe9b90ba1e7774c48a398df"
	 'SKIP')

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/obs-${_pluginname}/LICENSE"

	tar xzvf obs-${_pluginname}-*-linux64.tar.gz

	cd ${srcdir}/obs-${_pluginname}

	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-${_pluginname}/

	install -Dm755 ./bin/64bit/obs-${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 data/* ${pkgdir}/usr/share/obs/obs-plugins/obs-${_pluginname}/
}
