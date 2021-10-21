# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server-bin
pkgver=0.7.2
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
sha256sums=('4318de559b9dedd40f1dc6e181f59bd10a3c4a37a84e0260f14fa340aa3b0952')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
