# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=mathjs
pkgname=nodejs-mathjs
pkgver=3.13.3
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
sha384sums=('f0677a9a66bb4c26c73f545f1589662d332670873434a58254d2b327bd9c6d28fca45aaed706bf43eb7d9c5be62c5cb9')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
