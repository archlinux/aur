# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="Language server implementation for Dockerfiles"
arch=('any')
url="https://www.npmjs.com/package/dockerfile-language-server-nodejs"
license=('MIT')
depends=('nodejs' 'npm')
replaces=('nodejs-docker-langserver')
conflicts=('nodejs-docker-langserver')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('ef9f1d0505cc584b6de657bcdb1c90c7ea5027ccc2eb1d8d4a77ee1ff3b545cb')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
