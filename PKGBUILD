# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=typescript-language-server
pkgname=typescript-language-server-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Language server implementation for JavaScript / TypeScript"
arch=('any')
url="https://www.npmjs.com/package/typescript-language-server"
license=('APACHE')
depends=('nodejs' 'npm' 'typescript')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('bc4da3c53536ecb63b4aa7ce4c49687bfeff273b')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    chown -R root:root "${pkgdir}"
}
