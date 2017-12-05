# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=vscode-css-languageserver-bin
pkgname=vscode-css-languageserver-bin
pkgver="1.1.0"
pkgrel=1
pkgdesc="Language server implementation for CSS"
arch=('any')
url="https://www.npmjs.com/package/vscode-css-languageserver-bin"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('82fefb0ee051ad4ae17d8000dcc7e297ff97ccdb')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
