# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=6.1303fb9
pkgrel=1
pkgdesc="Best-Effort Extent-Same, a btrfs deduplicator daemon"
arch=('any')
url="https://github.com/Zygo/bees"
license=('GPL3')
depends=()
makedepends=('git' 'make' 'gcc')
source=("$pkgname"::'git://github.com/Zygo/bees.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd ${pkgname}
	make
}

package() {
	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/lib/bees/
	mkdir -p ${pkgdir}/var/lib/bees/

	mv ${pkgname}/lib/libcrucible.so ${pkgdir}/usr/lib/
	mv ${pkgname}/bin/bees ${pkgdir}/usr/bin/
}
