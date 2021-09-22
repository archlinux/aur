# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=dockerfile-language-server-nodejs
pkgname=dockerfile-language-server-bin
pkgver=0.7.1
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
sha256sums=('8ca1a9e40b92c63abd9a7fb16a95ad85c033194d6d773505e244d24db1b3e036')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
