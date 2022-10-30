# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_npmname=qunit
pkgname="nodejs-${_npmname}"
pkgver=2.19.3
pkgrel=1
pkgdesc='An easy-to-use JavaScript unit testing framework.'
arch=('any')
url='http://qunitjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('089eb014477fdd8c9fb7d284addb9db3512e0a8a1772a87bf23e19a897a656be')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}

