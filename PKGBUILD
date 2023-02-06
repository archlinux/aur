# Maintainer: Youngjae Lee <ls4154.lee@gmail.com>
pkgname=dm-zoned-tools
pkgver=2.2.2
pkgrel=1
pkgdesc="User space utility for managing zoned block devices used with the dm-zoned device mapper "
arch=("x86_64")
url="https://github.com/westerndigitalcorporation/dm-zoned-tools"
license=("GPL3")
depends=("glibc" "util-linux-libs" "kmod" "device-mapper")
makedepends=("autoconf" "automake" "libtool" "autoconf-archive")
source=("$pkgname-$pkgver.tar.gz::https://github.com/westerndigitalcorporation/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("3395d8f31970585afaf6e58e5fc4d4eb18b8dc9b9c6c339930f32966c37f3dd2")

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
