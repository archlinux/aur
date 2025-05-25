# Maintainer: Kimiblock Moe

pkgname=nodejs-config
_pkgname=${pkgname#nodejs-}
pkgdesc="Node.js Application Configuration"
url="https://github.com/node-config/node-config"
license=(LicenseRef-node-config)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('adb708015dab06360ab4d49a6e1b28e91900971b6b057342107dbbbde6a30904'
            'c54d6c716be6b3e8751edd8b3fc8b4cfaaa97d08b071ec68667b61113a7627cc')
arch=(any)
pkgver=4.0.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
	"LICENSE"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nodejs-config/LICENSE"
}


