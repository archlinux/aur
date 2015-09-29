# Contributor: Vojtech Kral <vojtech_kral^hk>

_npmname=handlebars
pkgname="nodejs-${_npmname}"
pkgver=4.0.2
pkgrel=1
pkgdesc='Handlebars provides the power necessary to let you build semantic templates effectively with no frustration.'
arch=('any')
url='http://handlebarsjs.com/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('09807745ef628ab8046c2cbce9f0e1c42e9b31e9f631e7bcc832a972a36182c2')

package() {
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
	rmdir "${pkgdir}/usr/etc"
}
