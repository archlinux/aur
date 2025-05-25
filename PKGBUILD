# Maintainer: Kimiblock Moe

pkgname=nodejs-better-sqlite3
_pkgname=${pkgname#nodejs-}
pkgdesc="The fastest and simplest library for SQLite3 in Node.js."
url="https://github.com/WiseLibs/better-sqlite3"
license=(MIT)
depends=()
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('71e2d66a44dafc35649ff82742cf4908557fc31841108d19703b74b7065c0293')
arch=(any)
pkgver=11.10.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


