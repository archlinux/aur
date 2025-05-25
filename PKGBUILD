# Maintainer: Kimiblock Moe

pkgname=nodejs-express
_pkgname=${pkgname#nodejs-}
pkgdesc="Fast, unopinionated, minimalist web framework for node"
url="https://github.com/expressjs/express"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('dd6bdb4d4e54d520c78443d5c35aa4ae552be1837e8650d2ec1641df99393e1b')
arch=(any)
pkgver=5.1.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


