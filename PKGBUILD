# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=bash-language-server
pkgname=bash-language-server-bin
pkgver="1.4.1"
pkgrel=1
pkgdesc="Language server implementation for bash"
arch=('any')
url="https://www.npmjs.com/package/bash-language-server"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('f88353dcb47dd06f67fde44051e34f6f97897239')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
