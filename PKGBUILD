# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_npmname=qunit
pkgname="nodejs-${_npmname}"
pkgver=2.19.4
pkgrel=1
pkgdesc='An easy-to-use JavaScript unit testing framework.'
arch=('any')
url='http://qunitjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('77513276ce4323265998f0aa06e8b464d6584459a1f1b01bcd0f731d13af5c8c')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}

