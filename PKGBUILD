# Contributor: Devaev Maxim <mdevaev@gmail.com>


pkgname="servoblaster"
pkgver="20191001"
pkgrel="1"
pkgdesc="Userspace daemon that lets you control 8 (or more) servos from your RaspberryPi"
url="https://github.com/richardghirst/PiBits/tree/master/ServoBlaster"
license=("GPL")
arch=("armv6h" "armv7h")
makedepends=("gcc" "make")
conflicts=("servoblaster-git")
_commit="ff1d383a37d190ae21010dc1f3671f4d222b9158"
source=("https://github.com/richardghirst/PiBits/archive/$_commit.tar.gz")
md5sums=("7dbb9b70865cdeac4bb0bbe71067e25b")


build() {
	cd "$srcdir/PiBits-$_commit/ServoBlaster/user"
	make
}

package() {
	cd "$srcdir/PiBits-$_commit/ServoBlaster/user"
	mkdir -p $pkgdir/usr/bin
	install servod $pkgdir/usr/bin/
}
