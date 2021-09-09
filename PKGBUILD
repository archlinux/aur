# Maintainer: Brodi <me@brodi.space>
_pluginname=image-reaction
pkgname=obs-${_pluginname}-bin
pkgver=1.2
pkgrel=1
pkgdesc="OBS Plugin with image that reacts to sound source."
arch=("x86_64")
url="https://github.com/scaledteam/obs-image-reaction"
license=("GPL2")
depends=("obs-studio>=24.0.0")
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/obs-${_pluginname}-linux64.zip"
	"https://raw.githubusercontent.com/scaledteam/obs-image-reaction/${pkgver}/LICENSE")
sha512sums=("0c4a29ec5e88a52c951a362f07ae4e655c8247603e9b7e7ed89fe1c3aa72536dc06eb7889d0a096bf07f8d5a359b8b6384d1d26d35b86c25b33f93c3cfa53879"
	"SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/obs-${_pluginname}/LICENSE"

	cd ${srcdir}/libimage-reaction
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 ./bin/64bit/libimage-reaction.so ${pkgdir}/usr/lib/obs-plugins/
}
