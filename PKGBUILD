# Maintainer: RainMark rain.by.zhou@gmail.com
pkgname=openkeeper-cli
pkgver=2.0
pkgrel=1
pkgdesc="Netkeeper for Linux Desktop."
arch=("x86_64" "i686")
url="https://github.com/Eventide/openkeeper-cli"
license=('GPL')
depends=("rp-pppoe")
makedepends=("openssl")
source=("https://github.com/RainMark/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("9757e154d95207e1cc7a6b6833525752")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/openkeeper"
	install -m 755 dialnetkeeper/dialnetkeeper "$pkgdir/usr/bin"
	install -m 755 ok ok-* "$pkgdir/usr/bin"
	install -m 644 pppoe.conf pap-secrets "$pkgdir/usr/share/openkeeper"
}
