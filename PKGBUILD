# Maintainer: Kimiblock Moe

pkgname=nodejs-typebox
_pkgname=${pkgname#nodejs-}
pkgdesc="Code Generation for TypeBox Types"
url="https://github.com/sinclairzx81/typebox"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('b00381ed82f26dc8698387fcc15a571273876c00ec570511d3308185136d1326')
arch=(any)
pkgver=0.34.33
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@sinclair/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@sinclair/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


