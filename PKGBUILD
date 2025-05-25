# Maintainer: Kimiblock Moe

pkgname=nodejs-html-to-text
_pkgname=${pkgname#nodejs-}
pkgdesc="Node.js Application Configuration"
url="https://github.com/html-to-text/node-html-to-text"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('3c295e9f4a56b6cc95155505deb37954bd9d299e7810aa03661ae69e68ce1a2d')
arch=(any)
pkgver=9.0.5
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}


