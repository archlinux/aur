# Maintainer: Soma Zambelly <zambelly.soma@gmail.com>
pkgname=reveng
pkgver=2.1.0
pkgrel=2
pkgdesc="Arbitrary-precision CRC calculator and algorithm finder"
arch=(x86_64)
url="http://reveng.sourceforge.net/"
license=('GPL')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.xz/download")
sha256sums=("7058c7c653692c66849e8a5f5c7f5d69fbead9c1ccc012e1844c7299ddf0e730")

build() {
	cd "$pkgname-$pkgver"
	sed -i 's/#define BMP_BIT   32/#define BMP_BIT   64/' config.h
	sed -i 's/#define BMP_SUB   16/#define BMP_SUB   32/' config.h
	make
}

package() {
	cd "$pkgdir"
	install -D "$srcdir/$pkgname-$pkgver/reveng" usr/bin/reveng
}
