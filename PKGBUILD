# Maintainer: Daniele Cocca <daniele.cocca@gmail.com>
_npmname=lambda
pkgname="nodejs-${_npmname}"
pkgver=0.10.3
pkgrel=1
pkgdesc="An effort to create the perfect programming language."
arch=('any')
url="https://github.com/71104/lambda"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('c18475690f8deed364e2bf9a18a59ec565c9c27edcb929b8edc5ea202f1fed88')
options=('!emptydirs')

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"

  npm --offline install --user root -g --prefix "${pkgdir}/usr" "${srcdir}/${_npmname}-${pkgver}.tgz"
}
