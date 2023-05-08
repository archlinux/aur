# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.11.3
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64" "aarch64" "armhf")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/4-linux/603-qtvlm-5-11-3-1")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/607-qtvlm-5-11-3-4")
source_armhf=("$pkgname-$pkgver-armhf.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/605-qtvlm-5-11-3-3")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('f2fd2529dfa1c8c9ea836bcc16aef42155383cfa410a751dc10c2fa1b1c64a8c')
sha256sums_aarch64=('3cc30e8d98bb34a650b2cc21897a38a99a49fa6a77083c102bcdfd282064dc6b')
sha256sums_armhf=('3ff8fec8fba074b9a75c84e21e55814ef700db1d38abd033682b844481dd94e2')


package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
