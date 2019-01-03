# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=1.3
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/tavianator/bfs"
license=('BSD')
groups=()
depends=('acl' 'libcap')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tavianator/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('77bb26bbb2de7ebed792a2915cbfc2ec')
sha256sums=('3e6af64bce245dd5085e570356e2556764ac3f1bac53b8c86caec1bea8683e31')
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
