# Maintainer: Kimiblock Moe

pkgname=nodejs-reveal.js
_pkgname=${pkgname#nodejs-}
pkgdesc="The HTML Presentation Framework"
url="https://github.com/hakimel/reveal.js"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('359b575dd51bbda32f89b2fd4c7dc46ad7389a805572158916c29252f7a27333'
            '34014800f4126ac2525e224166f099f26628612e95c41f76d70841b63138c989')
arch=(any)
pkgver=5.2.1
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
