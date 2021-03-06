# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=bfs
pkgver=2.2
pkgrel=1
pkgdesc="A breadth-first version of find."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tavianator.com/projects/bfs.html"
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
md5sums=('14ade00ae350556a30931764e0af3946')
sha256sums=('09cff2033544cbaa31af2ad7d59347056a53c04ff7c469bb5904e575d3641053')
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
