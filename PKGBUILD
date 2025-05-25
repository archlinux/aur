# Maintainer: Kimiblock Moe

pkgname=nodejs-matrix-protection-suite
_pkgname=${pkgname#nodejs-}
pkgdesc="library for interacting with matrix policy lists for moderation"
url="https://github.com/Gnuxie/matrix-protection-suite/"
license=(MIT CC0-1.0 CC-BY-SA-4.0 Apache-2.0 AFL-3.0)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('2e8835e42a66be255a1ec432b149a99205150527edea2876c189969b09ded358')
arch=(any)
pkgver=3.1.2
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@gnuxie/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@gnuxie/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


