# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server-bin
pkgver=0.0.22
pkgrel=1
pkgdesc="Language server implementation for Dockerfiles"
arch=('any')
url="https://www.npmjs.com/package/dockerfile-language-server-nodejs"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('9b214988b16b7c32986a66741e1f6eb88da62385')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
