# Maintainer: Youngjae Lee <ls4154.lee@gmail.com>
pkgname=dm-zoned-tools
pkgver=2.1.3
pkgrel=1
pkgdesc="User space utility for managing zoned block devices used with the dm-zoned device mapper "
arch=("x86_64")
url="https://github.com/westerndigitalcorporation/dm-zoned-tools"
license=("GPL3")
depends=("glibc" "util-linux-libs" "kmod" "device-mapper")
makedepends=("autoconf" "automake" "libtool" "autoconf-archive")
source=("$pkgname-$pkgver.tar.gz::https://github.com/westerndigitalcorporation/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("d836ee377d17235710c06b07fc747da3")

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --sbindir='${exec_prefix}/bin'
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
