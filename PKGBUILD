# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=vscode-json-languageserver-bin
pkgname=vscode-json-languageserver-bin
pkgver="1.0.1"
pkgrel=2
pkgdesc="Language server implementation for JSON"
arch=('any')
url="https://www.npmjs.com/package/vscode-json-languageserver-bin"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('ffe59ea265c63f3d20d3b44f4c19a86dfc99de64')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
