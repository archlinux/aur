# Maintainer: Kimiblock Moe

pkgname=nodejs-pg
_pkgname=${pkgname#nodejs-}
pkgdesc="PostgreSQL client for node.js"
url="https://github.com/brianc/node-postgres"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('9c82b708ad2002d73a7b4d0797625f655c6270b877b024ff1c4f65fbe9451ed4')
arch=(any)
pkgver=8.16.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


