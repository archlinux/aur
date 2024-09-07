pkgname=bshchk-git
pkgver=master
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

package() {
	cd "$srcdir/bshchk"
	install -Dm755 bshchk "$pkgdir/usr/bin/bshchk"
}
