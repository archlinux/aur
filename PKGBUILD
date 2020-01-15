# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.3

pkgname=fennel
_pkgver='0.3.2'
pkgver=0.3.2
pkgrel=2
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${_pkgver}.tar.gz")
sha512sums=('14fe3e2530d7d733c39a457067669ec21e2aa071bdc4de5b787051ebe7af3d276715666ffded3f90cfcb8bd6a19b777130d2b8159ae6991dcdc4bbe4b62b269b')

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
