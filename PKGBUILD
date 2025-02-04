# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.12.14
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64" "aarch64" "armhf")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/4-linux/882-qtvlm-5-12-14-5")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/881-qtvlm-5-12-14-4")
source_armhf=("$pkgname-$pkgver-armhf.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/879-qtvlm-5-12-14-2")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('475f615d3668d5be307276dfab619ddb31ec728b0c18605c8346bd084679ed17')
sha256sums_aarch64=('6dd56052d36b58021cf16f27d3002217ad39756bed0991d4653362e63917e36e')
sha256sums_armhf=('789970730b4ba171c72f3989742da069ffcaf23623bde0dcac81cd1007c91467')


package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
