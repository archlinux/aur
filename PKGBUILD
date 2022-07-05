# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=2.6.1
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tavianator.com/projects/bfs.html"
license=('BSD')
groups=()
depends=('acl' 'libcap' 'oniguruma')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tavianator/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('15e35b46774af305cbdfbfaa9889591440579a8233bc7308e050ec27b791647d')
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
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
