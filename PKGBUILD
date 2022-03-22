# Maintainer: jzbor <zborof at posteo dot de>

pkgname=pimenu
pkgver=3.0.1
pkgrel=2
pkgdesc="A pie-menu in xlib and imlib2."
arch=(x86_64 i686 aarch64)
url="https://github.com/phillbush/pmenu"
license=("MIT")
depends=(imlib2 libxinerama)
makedepends=(libxft libxinerama)
provides=("pmenu")
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('e4819c1e35febf60e0b2e0c3c582f4896ad62e086bfd41981fdf2ef26f04245deb9285f093de4301c3d99b328520cc2c6f347dbda7034322fd0eddb8a3406e03')

build() {
	cd "pmenu-$pkgver"
	make
}

package () {
	cd "pmenu-$pkgver"
	make INSTALL="install" DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
