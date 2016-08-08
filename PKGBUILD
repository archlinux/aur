# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=mathjs
pkgname=nodejs-mathjs
pkgver=3.4.0
pkgrel=2
pkgdesc="An extensive math library for JS which also includes a powerful CLI interface"
arch=(any)
url="https://www.npmjs.com/package/${_npmname}"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=(${_npmname}-${pkgver}.tgz)
sha384sums=('1cd1c1dff9cc03dde966568d8ced3b49b6e0b77f1abb72cf48f9e7947d9c39ae1fd2d52ec190b17c7e7b7b7058f1a00f')

package() {
    cd "$srcdir"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
    rmdir "${pkgdir}/usr/etc"
}
