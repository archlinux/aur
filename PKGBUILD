# Maintainer: Kimiblock Moe

pkgname=nodejs-sentry-node
_pkgname=node
pkgdesc="Official Sentry SDKs for JavaScript"
url="https://github.com/getsentry/sentry-javascript"
license=(MIT)
makedepends=('npm')
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('ff92910fffd16ff0ef3a49ddd7cf9b5dff7d8e17c0f14b5aaa1f631305b68edf')
arch=(any)
pkgver=9.22.0
pkgrel=1
source=(
	"${_pkgname}-${pkgver}.tgz"::"https://registry.npmjs.org/@sentry/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
)
function package() {
	npm i -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -srf "${pkgdir}/usr/lib/node_modules/@sentry/${_pkgname}" "${pkgdir}/usr/lib/node_modules/${_pkgname}"
}


