# Contributor: Stanislau Kviatkouski <7zete7@gmail.com>

_npmname=handlebars
pkgname="nodejs-${_npmname}"
pkgver=4.7.6
pkgrel=1
pkgdesc='Handlebars provides the power necessary to let you build semantic templates effectively with no frustration.'
arch=('any')
url='http://handlebarsjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('5d78499ce597c9bfb9d8aef40cd12e640acbdc8529f5ca14b84b76535f40fa9c')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
