# Maintainer: Kimiblock Moe

pkgname=nodejs-matrix-basic-types
_pkgname=${pkgname#nodejs-}
pkgdesc=""
url="https://github.com/the-draupnir-project/matrix-basic-types"
license=(MIT CC0-1.0 CC-BY-SA-4.0 Apache-2.0)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('08eb9ab9b11e94043ee37e49a524c8f3dd184c2a5c3afccfe2904a2ed73fc3cb')
arch=(any)
pkgver=1.3.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@the-draupnir-project/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@the-draupnir-project/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


