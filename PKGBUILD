# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=qtvlm-bin
pkgver=5.9.8.p1
pkgrel=1
pkgdesc="Navigation and Weather Routing software"
arch=("x86_64")
url="https://www.meltemus.com/index.php/"
license=('unknown')
options=("!strip")
source=("$pkgname-$pkgver.tar.gz::https://www.meltemus.com/index.php/fr/download/send/6-linux-64b/206-qtvlm-5-9-8-p1-3"
        "qtvlm.desktop")
sha256sums=('e6788ae4163dedb9dda1acba9d06a6abba743e08d79392797c931681e84d3ef9'
            'a0157e13f6914ce6d32aebc1caec4b75fd185b46dbcf127e882b3abe34cd7c2d')

package() {
	mkdir -p "$pkgdir"/opt/qtvlm
	cp -R "$srcdir"/qtVlm/* "$pkgdir"/opt/qtvlm/
	install -Dm644 "$srcdir"/qtvlm.desktop "$pkgdir"/usr/share/applications/qtvlm.desktop
	install -Dm644 "$srcdir"/qtVlm/icon/qtVlm_48x48.png "$pkgdir"/usr/share/pixmaps/qtvlm.png
	chmod a+w -R "$pkgdir"/opt/qtvlm/ 
}
