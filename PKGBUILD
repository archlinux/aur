pkgname=bshchk-git
pkgver=1.1.r0.g96d42c6
pkgrel=1
arch=('any')
license=('GPL-3.0-only')
provides=('bshchk')
conflicts=('bshchk')

source=('git+https://git.blek.codes/blek/bshchk.git')
sha256sums=('SKIP')

makedepends=('go')

build() {
	cd "$srcdir/bshchk"
	./build.sh
}

pkgver() {
	cd "$srcdir/bshchk"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/bshchk"
	install -Dm755 bshchk "$pkgdir/usr/bin/bshchk"
}
