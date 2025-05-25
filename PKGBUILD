# Maintainer: Kimiblock Moe

pkgname=nodejs-typescript-result
_pkgname=${pkgname#nodejs-}
pkgdesc="This is just a simple result type so that we can have type checked error handling pretty please."
url="https://github.com/Gnuxie/typescript-result"
license=(CC0-1.0 CC-BY-SA-4.0 Apache-2.0)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('40de09e8dbf16c776eba35b5192c372df327ba847f1686dc57b107c274375b82')
arch=(any)
pkgver=1.0.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@gnuxie/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@gnuxie/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


