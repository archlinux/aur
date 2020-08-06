# Maintainer: zuckerschecke <aur at patrickmang dot de>

pkgname=ifdtool-git
pkgver=r36072.20905cfe264
pkgrel=1
pkgdesc="Extract and dump Intel Firmware Descriptor information."
url="https://github.com/coreboot/coreboot/tree/master/util/ifdtool"
license=('GPL2')
arch=('i686' 'x86_64' 'arm')
makedepends=('git')
conflicts=('ifdtool')
provides=('ifdtool')
source=('git+https://review.coreboot.org/coreboot')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/coreboot"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/coreboot/util/ifdtool"
	make
}

package() {
	cd "$srcdir/coreboot/util/ifdtool"
	install -d "$pkgdir/usr/bin"
	install -m755 ifdtool "$pkgdir/usr/bin/ifdtool"
}
