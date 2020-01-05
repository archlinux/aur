# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.3

pkgname=fennel
_pkgver='0.3.1'
pkgver=0.3.1
pkgrel=2
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${_pkgver}.tar.gz")
sha512sums=('bcc34429c616f4bad471a4ba6a830d58254582a82384d71a8bee81b72bb531d0322b5160d7e741cdff0bf8a421f0630b967ca45ae6594f06877b3029bc063385')

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
