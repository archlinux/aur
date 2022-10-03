# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.10.18
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64" "aarch64" "armhf")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/4-linux/530-qtvlm-5-10-17-8")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/529-qtvlm-5-10-17-7")
source_armhf=("$pkgname-$pkgver-armhf.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/528-qtvlm-5-10-17-6")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('00b88f1f4bf9bee39d0689f355147b571d4e90aff4d3ce22ed5b1f5b87cbbdd8')
sha256sums_aarch64=('428b5333e99189ac074ca7c5e238b2a4e2972571ca931dec6a33aa325039b1c1')
sha256sums_armhf=('3d807c85a80272aba2d4c8fea7f17b47e0e022c14bc0dcadb37a721d59d8018c')


package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
