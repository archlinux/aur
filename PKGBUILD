# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=yaml-language-server
pkgname=yaml-language-server-bin
pkgver=0.18.0
pkgrel=4
pkgdesc="Language server implementation for YAML files and optional schema support"
arch=('any')
url="https://github.com/redhat-developer/yaml-language-server"
license=('MIT')
makedepends=('npm')
depends=('nodejs')
replaces=('yaml-language-server')
provides=('yaml-language-server')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('c2a57a8ab9a1002c8022fcbfe64582a56d0599ca')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    mkdir -p "${pkgdir}/usr/bin"
}
