# Maintainer: Kimiblock Moe

pkgname=nodejs-matrix-bot-sdk
_pkgname=${pkgname#nodejs-}
pkgdesc="TypeScript/JavaScript SDK for Matrix bots"
url="https://github.com/turt2live/matrix-bot-sdk"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('c386b8f558535043dabad9da34979bf6788fa565ac5ee99d87a93bc3ba47220b')
arch=(any)
pkgver=0.7.1
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


