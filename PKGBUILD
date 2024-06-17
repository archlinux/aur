# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=fhex
pkgver=3.0.5
pkgrel=1
pkgdesc='Full-featured hex editor'
arch=(x86_64)
url=https://github.com/echo-devim/fhex
license=(GPL3)
depends=(capstone keystone qt5-charts)
makedepends=(qt5-base)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname.desktop)
sha512sums=('812bb3de7bcca8eef98b6cefca6f8745be66b0d2ea4211b83bfd9a337b454a0c2378ef5f053a69a375d016822d6cfd26ca182a3e5d7d6e1913b3e586bb5519f4'
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
