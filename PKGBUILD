# Maintainer: Kimiblock Moe

pkgname=nodejs-reveal.js
_pkgname=${pkgname#nodejs-}
pkgdesc="The HTML Presentation Framework"
url="https://github.com/hakimel/reveal.js"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('95cd9acaa32361a32084fd444c5707e7aa43bfb6b3fab18ff9a2f399072b1d4c' 'SKIP')
arch=(any)
pkgver=5.0.4
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
	LICENSE::"https://github.com/hakimel/reveal.js/raw/master/LICENSE"
)
function package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
