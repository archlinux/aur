# Maintainer: MatMoul <matmoul at the google email domain which is .com>

pkgname=alpm_octopi_utils
pkgver=1.0.2
pkgrel=3
pkgdesc="Alpm utils for Octopi"
arch=('any')
url="https://tintaescura.com/projects/octopi/"
license=('GPL3')
depends=('pacman-contrib')
makedepends=('git' 'vala')
source=("git+https://github.com/aarnt/alpm_octopi_utils.git#commit=1e735c3a27803ca5b6470e946f9cac708143dfd9")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -D -m755 src/libalpm_octopi_utils.so "$pkgdir"/usr/lib/libalpm_octopi_utils.so
	install -D -m644 src/libalpm_octopi_utils.pc "$pkgdir"/usr/lib/pkgconfig/libalpm_octopi_utils.pc
	install -D -m644 src/alpm_octopi_utils.h "$pkgdir"/usr/include/alpm_octopi_utils.h
}
