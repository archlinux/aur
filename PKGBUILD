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
sha512sums=('eaaf516b51e32838d6ff85d8fe056265ea855ddd48b5b5159803330921825ada26b70c5503380f40abb73b073627d96f1bc0161c8a69e89ed2be92c32cdecb70')

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.fnl" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
