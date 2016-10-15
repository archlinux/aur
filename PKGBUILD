# Maintainer: RainMark rain.by.zhou@gmail.com
pkgname=openkeeper-cli
pkgver=2.0
pkgrel=4
pkgdesc="Netkeeper for Linux Desktop."
arch=("x86_64" "i686")
url="https://github.com/Eventide/openkeeper-cli"
license=('GPL v2')
depends=("rp-pppoe")
makedepends=("openssl")
source=("https://github.com/RainMark/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("9757e154d95207e1cc7a6b6833525752")

build() {
	cd "$srcdir/$pkgname-$pkgver/dialnetkeeper"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/openkeeper/"
	install -Dm 755 "dialnetkeeper/dialnetkeeper" "$pkgdir/usr/bin/"
	install -Dm 755 "ok" "$pkgdir/usr/bin/"
	install -Dm 755 "ok-config" "$pkgdir/usr/bin/"
	install -Dm 755 "ok-connect" "$pkgdir/usr/bin/"
	install -Dm 755 "ok-start" "$pkgdir/usr/bin/"
	install -Dm 755 "ok-stop" "$pkgdir/usr/bin/"
	install -Dm 644 "pppoe.conf" "$pkgdir/usr/share/openkeeper/"
	install -Dm 644 "pap-secrets" "$pkgdir/usr/share/openkeeper/"
}
