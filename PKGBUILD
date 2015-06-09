# Contributor: Devaev Maxim <mdevaev@gmail.com>


pkgname="servoblaster"
pkgver="20140103"
pkgrel="2"
pkgdesc="Userspace daemon that lets you control 8 (or more) servos from your RaspberryPi"
url="https://github.com/richardghirst/PiBits/tree/master/ServoBlaster"
license="GPL"
arch=("armv6h")
makedepends=("gcc" "make")
_commit="2ea384c0c71033ca239b51943b1321d84b39350e"
source=("https://github.com/richardghirst/PiBits/archive/$_commit.tar.gz")
md5sums=("c6840744b5eb181305a19d72f43bffaf")


build() {
	cd "$srcdir/PiBits-$_commit/ServoBlaster/user"
	make
}

package() {
	cd "$srcdir/PiBits-$_commit/ServoBlaster/user"
	mkdir -p $pkgdir/usr/bin
	install servod $pkgdir/usr/bin/
}
