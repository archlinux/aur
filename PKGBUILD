# Maintainer: Kimiblock Moe

pkgname=nodejs-body-parser
_pkgname=${pkgname#nodejs-}
pkgdesc="Node.js body parsing middleware"
url="https://github.com/expressjs/body-parser"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('b63cac7cddcd5aa4f06a117b3fcbc5e35a879bea06702dbbb26f7d98195cfaf6')
arch=(any)
pkgver=2.2.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


