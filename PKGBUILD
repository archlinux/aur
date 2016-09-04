# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=0.82
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tavianator/bfs"
license=('custom:WTFPL')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tavianator/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e769b5603889f9d50046576aee5fd259')
sha256sums=('34d726ec7a778e6122fb3ea89928b0c1b36b1ef946bb2c3e5452f56aa15a8673')
noextract=()

build() {
	cd "${pkgname}-${pkgver}"
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
