# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.9.14
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/6-linux-64b/271-qtvlm-5-9-14-p1-4")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/274-qtvlm-5-9-14-p1-7")

sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('ea1bc09f4147044e9c5e257a776258787a6337b6ad40d026e59ca6d27b85e49d')

package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
