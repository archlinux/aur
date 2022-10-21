# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

_npmname=qunit
pkgname="nodejs-${_npmname}"
pkgver=2.19.2
pkgrel=1
pkgdesc='An easy-to-use JavaScript unit testing framework.'
arch=('any')
url='http://qunitjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('09a83d18e1a2959b8b2ed1c2020eef4fa88ade12ddfbeac97762b87efc9f202d')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}

