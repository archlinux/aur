# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=mathjs
pkgname=nodejs-mathjs
pkgver=3.8.1
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
sha384sums=('6d951cce8a2f8ac01fae436827357da0311d6de55717ce1271c7ba2435f0391d547c463f2052d9905ff725dbea07f14d')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
