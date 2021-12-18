# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Language server implementation for Dockerfiles"
arch=('any')
url="https://www.npmjs.com/package/dockerfile-language-server-nodejs"
license=('MIT')
depends=('nodejs' 'npm')
replaces=('nodejs-docker-langserver')
conflicts=('nodejs-docker-langserver')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('66235a848feeee20e7e9e391e749f3ef38d0b12ef3f7c046ccdb73d664e5d9e2')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
