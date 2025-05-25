# Maintainer: Kimiblock Moe

pkgname=nodejs-matrix-appservice-bridge
_pkgname=${pkgname#nodejs-}
pkgdesc="Bridging infrastructure for Application Services"
url="https://github.com/matrix-org/matrix-appservice-bridge"
license=(Apache-2.0)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('ed366c456980810802e2a3d17813841c0d890efc7036bf38da5c273af172bc3d')
arch=(any)
pkgver=10.3.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


