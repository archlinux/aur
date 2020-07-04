# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.9.10
pkgrel=2
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/6-linux-64b/218-qtvlm-5-9-10-3")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/221-qtvlm-5-9-10-6")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('b397879ef3362dd0cecf864f798f038beef4931d1c8c59f007b8e300ebe3754b')
sha256sums_aarch64=('119675f000ad897d2b5b9cee9d132c671df6beadbff7307815cbe9e766bc2f84')

package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
