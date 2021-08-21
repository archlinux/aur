# Maintainer: Youngjae Lee <ls4154.lee@gmail.com>
pkgname=libzbd
pkgver=1.5.0
pkgrel=1
pkgdesc="Zoned block device manipulation library and tools"
arch=("x86_64")
url="https://github.com/westerndigitalcorporation/libzbd"
license=("LGPL3")
depends=("glibc")
makedepends=("autoconf" "automake" "libtool" "m4" "autoconf-archive")
optdepends=("gtk3")
source=("$pkgname-$pkgver.tar.gz::https://github.com/westerndigitalcorporation/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("205d4b893a76da5a6604ccb5f9afee46")

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
