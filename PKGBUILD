# Maintainer: Katie Wolfe <katie@dnaf.moe>

_lua_version=5.3

pkgname=fennel
_pkgver='0.2.1-2'
pkgver=0.2.1_2
pkgrel=2
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${_pkgver}.tar.gz")
sha512sums=('cd09af8b0902ec56023a00695d83c149a0176106ad638d74edc8d44c9149047bf3bd7feb067617a410837e6650dc180df6cbdfaf1f37b499497964bcd09c66f4')

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
