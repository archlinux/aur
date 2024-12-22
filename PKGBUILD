# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.12.13
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64" "aarch64" "armhf")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/4-linux/864-qtvlm-5-12-13-5")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/866-qtvlm-5-12-13-7")
source_armhf=("$pkgname-$pkgver-armhf.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/867-qtvlm-5-12-13-8")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('b4d716535917df9a542d0a45e544d8e2f5b484ab3c554097f3302d906d6294a8')
sha256sums_aarch64=('0e2824675e9aa73376770b2c9fc08f496ce4477a0773768ceb51f043a1c9138b')
sha256sums_armhf=('1f1a0d7be9c390f59945516dc6b56f2bb515649b0d7fff3f8b051f918bacb2f8')


package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
