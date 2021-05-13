# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.10.2
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64" "aarch64" "armhf")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/6-linux-64b/293-qtvlm-5-10-2-5")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/295-qtvlm-5-10-2-7")
source_armhf=("$pkgname-$pkgver-armhf.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/295-qtvlm-5-10-2-7")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('e4ddf972c5da924816adda811a51c1ef8349d5839c5d29f4c015cfe444cdf450')
sha256sums_aarch64=('9a1fee6f670147def8cb6b641e5736202be508114bab8b59cf738450ebb008b8')
sha256sums_armhf=('9a1fee6f670147def8cb6b641e5736202be508114bab8b59cf738450ebb008b8')


package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
