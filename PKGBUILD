# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=vscode-css-languageserver-bin
pkgname=vscode-css-languageserver-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Language server implementation for CSS"
arch=('any')
url="https://www.npmjs.com/package/vscode-css-languageserver-bin"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
md5sums=('d5e0e16469b1897dcb50a318f35a6fbe')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
