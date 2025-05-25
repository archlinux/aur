# Maintainer: Kimiblock Moe

pkgname=nodejs-jsdom
_pkgname=${pkgname#nodejs-}
pkgdesc="A JavaScript implementation of various web standards, for use with Node.js"
url="https://github.com/jsdom/jsdom"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('5619b4779f68dec3ae076a97ccc5b8e4aeceaef7d4821ebcfcc1eb124b192000')
arch=(any)
pkgver=26.1.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


