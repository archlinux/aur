# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=1.0
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
md5sums=('c1aec27f0cddf6ca7b889a29674d2e9e')
sha256sums=('042e186fe08e4d424a22568c41650c8b79fe8a3f468b97e362e2ee4a2a61e170')
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
