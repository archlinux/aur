# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=mathjs
pkgname=nodejs-mathjs
pkgver=3.5.3
pkgrel=3
pkgdesc="An extensive math library for JS which also includes a powerful CLI interface"
arch=(any)
url="https://www.npmjs.com/package/${_npmname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=(${_npmname}-${pkgver}.tgz)
sha384sums=('e57014556db9e4b33f1703abad75effd33c90f14d806d0b0d81ff7896813998d9d2e424328eef7c41288ea23df699cfa')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
