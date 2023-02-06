# Maintainer: Youngjae Lee <ls4154.lee@gmail.com>
pkgname=libzbd
pkgver=2.0.4
pkgrel=1
pkgdesc="Zoned block device manipulation library and tools"
arch=("x86_64")
url="https://github.com/westerndigitalcorporation/libzbd"
license=("LGPL3")
depends=("glibc")
makedepends=("autoconf" "automake" "libtool" "m4" "autoconf-archive")
optdepends=("gtk3")
source=("$pkgname-$pkgver.tar.gz::https://github.com/westerndigitalcorporation/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("03dc0fa849c47d46f377b4bbcb829353cffdd03b21dce1d8518224cb4cc92376")

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
