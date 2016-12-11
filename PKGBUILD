# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=create-react-app
pkgname="nodejs-${_npmname}"
pkgver=1.0.2
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
sha384sums=('ee13cb08cd53f4900aeea3634a4382da43f8cfc6293d959ca6f125e111f5671f8b2e1242dd9f5decd84dd8761aabb793')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
