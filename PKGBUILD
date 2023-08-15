# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=fhex
pkgver=3.0.4
pkgrel=2
pkgdesc='Full-featured hex editor'
arch=(x86_64)
url=https://github.com/echo-devim/fhex
license=(GPL3)
depends=(capstone keystone qt5-charts)
makedepends=(qt5-base)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname.desktop)
sha512sums=('269244a6f3b0c7ea393af23be43c319690e94f036f6cf486cfa3f2c32815b3a3c6279adc5621a17a39a0e9b9109acfb3135ab988f4d77bd12e3de7c65b6cc635'
            '5cf9313b0243033f1f308d9b1578d9557697f85a3910cbc5918ea9d1f6873ebab1ec25be556fa362016a8ac7386b55a5853d9cabc6fae368c02939e2a5105e83')

build() {
	cd $pkgname-$pkgver
	qmake .
	make
}

package() {
	cd $pkgname-$pkgver
	install -D $pkgname -t "$pkgdir"/usr/bin
	install -Dm 644 ../$pkgname.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
