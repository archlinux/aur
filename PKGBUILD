# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.9.14
pkgrel=2
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("qtvlm.desktop")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/6-linux-64b/278-qtvlm-5-9-14-p2-4")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/9-raspberrypi/281-qtvlm-5-9-14-p2-7")
sha256sums=('a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')
sha256sums_x86_64=('1d1ef7ac95b52dd1e21ed4f5a154096205d07d756a28c81eda7a927a2c3d2fcc')

package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
