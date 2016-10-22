# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=create-react-app
pkgname="nodejs-${_npmname}"
pkgver=0.5.0
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
sha384sums=('c9c9af490483d075427aa40c0870237302b6781e6939abfb687451117f927ced19c1a3b5bb12b286ff2e1c58e191698d')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
