# Maintainer: jzbor <zborof at posteo dot de>

pkgname=pimenu
pkgver=2.5.0
pkgrel=1
pkgdesc="A pie-menu in xlib and imlib2."
arch=(x86_64 i686 aarch64)
url="https://github.com/phillbush/pmenu"
license=("MIT")
depends=(imlib2 libxinerama)
makedepends=(libxft libxinerama)
provides=("pmenu")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=("dd6fd6d40d3adfa38a3562549379ffda1f11249fcb22a9b9d53d0d4abbb04d3c16d84a28d7056c061ac531ea7a42b940558d68a8bd1137e2a9091130a18e43e8")

build() {
	cd "pmenu-$pkgver"
	make
}

package () {
	cd "pmenu-$pkgver"
	make PREFIX="$pkgdir/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
