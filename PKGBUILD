# Maintainer: John Regan <john@jrjrtech.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-date' 'lua51-date' 'lua52-date' 'lua53-date' 'lua54-date')
pkgver=2.2.1
pkgrel=1
pkgdesc="Date & Time module for Lua"
arch=('any')
url='https://github.com/tieske/date'
license=('MIT')
_lua_cur=5.5
_lua_next=5.6
source=("$pkgname-$pkgver.tar.gz::$url/archive/version_$pkgver.tar.gz")

_package() {
	LUA_V=$1

	cd "date-version_$pkgver"
	install -Dm 644 src/date.lua -t "$pkgdir/usr/share/lua/$LUA_V/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua-date(){
	pkgdesc="Date & Time module for Lua"
	depends=("lua>=${_lua_cur}" "lua<${_lua_next}")

	_package 5.5
}

package_lua51-date(){
	depends=('lua51')

	_package 5.1
}

package_lua52-date(){
	depends=('lua52')

	_package 5.2
}

package_lua53-date(){
	depends=('lua53')

	_package 5.3
}

package_lua54-date(){
	depends=('lua54')

	_package 5.4
}

sha512sums=(
'c50869c3e0f0880501cb090ec42a6deca51c2b16dc7354005e2b4cf1ed06e116ccea4b9fcf99921b3fc3c07282cc200c9eac891efc39d455bc8eba9ea6e83efb'
)
