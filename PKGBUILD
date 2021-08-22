# Maintainer: Brodi <me@brodi.space>
_pluginname=image-reaction
pkgname=obs-${_pluginname}-bin
pkgver=1.0
pkgrel=1
pkgdesc="OBS Plugin with image that reacts to sound source."
arch=("x86_64")
url="https://github.com/scaledteam/obs-image-reaction"
license=("GPL2")
depends=("obs-studio>=24.0.0")
provides=("obs-${_pluginname}")
conflicts=("obs-${_pluginname}-bin" "obs-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/obs-${_pluginname}-linux64.zip"
	"https://raw.githubusercontent.com/scaledteam/obs-image-reaction/${pkgver}/LICENSE")
sha512sums=("245da7ca1867e37b11f6cab1b4ebf2bf48f3116122fe0a5ac7bb4c2b1b5ddf88e2efc8d1976edfdaa8f92473dddff98c3af2679e01c1f26b564ea36c08c4c106"
	"SKIP")

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/obs-${_pluginname}/LICENSE"

	cd ${srcdir}/libimage-reaction
	install -d ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 ./bin/64bit/libimage-reaction.so ${pkgdir}/usr/lib/obs-plugins/
}
