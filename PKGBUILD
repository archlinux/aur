# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=create-react-app
pkgname="nodejs-${_npmname}"
pkgver=1.3.1
pkgrel=1
pkgdesc="Create React apps with no build configuration"
arch=(any)
url="https://www.npmjs.com/package/${_npmname}"
license=('BSD')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=(${_npmname}-${pkgver}.tgz)
sha384sums=('61e2d4bac8c4847b0d5f7b066907590d6f2adcbbedfe0abf54e44df58731c64cc451a8e3aa0a7aba7cfcc72514d90eea')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
