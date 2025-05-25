# Maintainer: Kimiblock Moe

pkgname=nodejs-interface-manager
_pkgname=${pkgname#nodejs-}
pkgdesc="This library provides a command-oriented presentation interface for Matrix bots"
url="https://github.com/the-draupnir-project/interface-manager"
license=(CC0-1.0 CC-BY-SA-4.0 Apache-2.0)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('b4f0288deb8d52776f6c727e407a97e0294a829265d910b7accbe28897adafe2')
arch=(any)
pkgver=4.1.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@the-draupnir-project/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@the-draupnir-project/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


