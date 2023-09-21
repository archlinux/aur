# Maintainer: Eragon <eragon at eragon dot re>
pkgname=pg_uuidv7
pkgver=1.3.0
pkgrel=1
pkgdesc="A tiny Postgres extension to create valid version 7 UUIDs in Postgres."
arch=(any)
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=('postgresql')
makedepends=('postgresql-libs' 'llvm15' 'clang15')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("002c1b4146eab1994e1e50a72b9084f8e74dc562727272a6255c4dc89a4d864f")
install=package.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}
