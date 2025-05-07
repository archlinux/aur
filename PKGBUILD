# Maintainer: Kimiblock Moe

pkgname=nodejs-vite
_pkgname=${pkgname#nodejs-}
pkgdesc="Next generation frontend tooling. It's fast!"
url="https://github.com/vitejs/vite"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('083dfbda7d984ea8884c23fc4e9778a0ef647442ecffb599026109d578753c0e'
            '29b68325fe026047d13e187b44c33b2acacf7dc647dec4583702e59f235e13b5')
arch=(any)
pkgver=6.3.5
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

