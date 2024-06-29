# Maintainer: Kimiblock Moe

pkgname=nodejs-vite
_pkgname=${pkgname#nodejs-}
pkgdesc="Next generation frontend tooling. It's fast!"
url="https://github.com/vitejs/vite"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('SKIP'
            'SKIP')
arch=(any)
pkgver=5.3.2
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

