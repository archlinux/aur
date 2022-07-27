# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_npmname=qunit
pkgname="nodejs-${_npmname}"
pkgver=2.19.1
pkgrel=1
pkgdesc='An easy-to-use JavaScript unit testing framework.'
arch=('any')
url='http://qunitjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('16131370705163cebb319b23f98e61c40c2914908a878b7a786496e87a3acfaf')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}

