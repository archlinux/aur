# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=0.67
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
md5sums=('9313cc28ee94fc0563fdf29032ed205c')
sha256sums=('8978895fe627f5d264c80d25bbe8f7557fdb334b6e9994d5e60a1c427ea1f911')
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
	install -D -m755 bfs "${pkgdir}/usr/bin/bfs"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}
