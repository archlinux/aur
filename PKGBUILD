# Maintainer: Eragon <eragon at eragon dot re>
pkgname=pg_uuidv7
pkgver=1.0.2
pkgrel=1
pkgdesc="A tiny Postgres extension to create valid version 7 UUIDs in Postgres."
arch=(any)
url="https://github.com/fboulnois/pg_uuidv7"
license=('MPL2')
depends=('postgresql')
makedepends=('postgresql-libs')
source=("https://github.com/fboulnois/pg_uuidv7/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("63a71426a7abd93f6d75d9e469f5978da0dd074de3cc82588711657b5bf9aec8")
install=package.install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}/" install
}
