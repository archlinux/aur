# Maintainer: Kimiblock Moe

pkgname=nodejs-vite
_pkgname=${pkgname#nodejs-}
pkgdesc="Next generation frontend tooling. It's fast!"
url="https://github.com/vitejs/vite"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('f88f798006657e0cee4f058319f5a8ddcd7194ec1d1856862dd97cb344f19f51'
            '29b68325fe026047d13e187b44c33b2acacf7dc647dec4583702e59f235e13b5')
arch=(any)
pkgver=6.3.2
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
	LICENSE::"https://github.com/vitejs/vite/raw/main/LICENSE"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	install -Dm755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

