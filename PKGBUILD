# mkspiffs - Tool to build and unpack SPIFFS images
# Maintainer: Christian Hammacher <bmasterc@gmail.com>

pkgname=mkspiffs-git
pkgver=0.1.2.r0.b7ff183
pkgrel=1
pkgdesc="Tool to build and unpack SPIFFS images"
arch=('x86' 'x86_64')
url="https://github.com/igrr/mkspiffs"
license=('MIT')
depends=()
makedepends=('git' 'gcc')
provides=("mkspiffs")
conflicts=("mkspiffs")
source=('git://github.com/igrr/mkspiffs.git')
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/mkspiffs"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/mkspiffs"
	make
}

check() {
	cd "$srcdir/mkspiffs"
	make test
}

package() {
	# This package provides only a single executable
	install -D -m755 $srcdir/mkspiffs/mkspiffs $pkgdir/usr/bin/mkspiffs
}
