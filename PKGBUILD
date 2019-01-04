# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=1.3.1
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
md5sums=('76f47434f8f6937fe83cad99108589d5')
sha256sums=('250474563ee9ae210088514eb1885d96db4f84549d8daf5a682ed3cd19f97f89')
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
