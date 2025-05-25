# Maintainer: Kimiblock Moe

pkgname=nodejs-matrix-protection-suite-for-matrix-bot-sdk
_pkgname=${pkgname#nodejs-}
pkgdesc="library for interacting with matrix policy lists for moderation"
url="https://github.com/Gnuxie/matrix-protection-suite/"
license=(AFL-3.0)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('434b3eef1215991858e9749d03c85867055a75243e0d3fb9dbd2deaf7c751bd6')
arch=(any)
pkgver=3.1.4
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@gnuxie/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@gnuxie/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


