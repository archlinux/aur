# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=ectool-git
pkgver=0.1.f813b844862
pkgrel=1
pkgdesc="Dumps the RAM of a laptop's Embedded/Environmental Controller (EC)"
url="https://www.coreboot.org/Ectool"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('ectool')
provides=('ectool')
source=('git+https://review.coreboot.org/coreboot')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/coreboot"
	echo "0.1.$(git log -1 --format="%h")"
}

build() {
	cd "$srcdir/coreboot/util/ectool"
	make
}

package() {
	cd "$srcdir/coreboot/util/ectool"
	install -d "$pkgdir/usr/bin"
	install -m755 ectool "$pkgdir/usr/bin/ectool"
}
