# Maintainer: graysky <graysky AT archlinux DOT us>
pkgname=odroid-c2-rtc
pkgver=1.20
pkgrel=1
pkgdesc="Use and automate kernel updates for the PCF8563 RTC Shield on the ODROID-C2"
arch=('aarch64')
url="https://github.com/graysky2/odroid-c2-rtc"
license=('MIT')
depends=('dtc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('52002d49bf97676c67882176f1f55d56')
install=$pkgname.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
