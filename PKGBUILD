# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=typescript-language-server
pkgname=typescript-language-server-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Language server implementation for JavaScript / TypeScript"
arch=('any')
url="https://www.npmjs.com/package/typescript-language-server"
license=('APACHE')
depends=('nodejs' 'npm' 'typescript')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('201dacbeee5162015859dc08cdfb56140fc1b5c7')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
