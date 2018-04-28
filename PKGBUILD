# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=vscode-html-languageserver-bin
pkgname=vscode-html-languageserver-bin
pkgver="1.3.0"
pkgrel=1
pkgdesc="Language server implementation for HTML"
arch=('any')
url="https://www.npmjs.com/package/vscode-html-languageserver-bin"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('5e3f2f4f7ce470ebca6184fe0ab16746da0ecee5')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
}
