# Maintainer: Eragon <eragon at eragon dot re>
pkgname=pg_uuidv7
pkgver=1.7.0
pkgrel=0
pkgdesc="A tiny Postgres extension to create valid version 7 UUIDs in Postgres."
arch=("x86_64" "aarch64")
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=('postgresql')
makedepends=('postgresql-libs' 'llvm' 'clang')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("ef1b332980ff1dfcf1962bf9b9e688254abf72f909de03cabed00a385c75148d")
install=package.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}
