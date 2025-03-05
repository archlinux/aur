# Maintainer: Kimiblock Moe

pkgname=nodejs-vite
_pkgname=${pkgname#nodejs-}
pkgdesc="Next generation frontend tooling. It's fast!"
url="https://github.com/vitejs/vite"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('243913ee586c10414765471a2cc4d367fe8e8f109b43b36102532b1f7f3c3909'
            '29b68325fe026047d13e187b44c33b2acacf7dc647dec4583702e59f235e13b5')
arch=(any)
pkgver=6.2.0
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

