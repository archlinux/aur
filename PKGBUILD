# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=mathjs
pkgname=nodejs-mathjs
pkgver=3.8.0
pkgrel=1
pkgdesc="An extensive math library for JS which also includes a powerful CLI interface"
arch=(any)
url="https://www.npmjs.com/package/${_npmname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=(${_npmname}-${pkgver}.tgz)
sha384sums=('6d4e303af1cfa266239eec900cfa3cce28c3cc8c477794d34d16f883f957a6591d93463ca1bcf0e0a5f6966075090bbb')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
