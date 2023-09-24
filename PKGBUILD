# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_npmname=qunit
pkgname="nodejs-${_npmname}"
pkgver=2.20.0
pkgrel=1
pkgdesc='An easy-to-use JavaScript unit testing framework.'
arch=('any')
url='http://qunitjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('d17644b47b52befd6cc30a56f35a8fc17a23ea22a95bc3c67e9dc7518a3bbc05')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}

