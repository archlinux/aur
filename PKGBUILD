# Maintainer: John Regan <john@jrjrtech.com>

pkgname=('lua-etlua' 'lua51-etlua' 'lua52-etlua' 'lua53-etlua' 'lua54-etlua')
_pkgname=etlua
pkgver=1.3.0
pkgrel=1
pkgdesc="Embedded Lua templates"
arch=('any')
url='https://github.com/leafo/etlua'
license=('MIT')
_lua_cur=5.5
_lua_next=5.6
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

_package() {
	LUA_V=$1

	cd "$_pkgname-$pkgver"
	install -Dm 644 etlua.lua -t "$pkgdir/usr/share/lua/$LUA_V/"
	install -Dm 644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua-etlua(){
	pkgdesc="Embedded Lua templates for Lua 5.5"
	depends=("lua>=${_lua_cur}" "lua<${_lua_next}")

	_package 5.5
}

package_lua54-etlua(){
	pkgdesc="Embedded Lua templates for Lua 5.4"
	depends=('lua54')

	_package 5.4
}

package_lua53-etlua(){
	pkgdesc="Embedded Lua templates for Lua 5.3"
	depends=('lua53')

	_package 5.3
}

package_lua52-etlua(){
	pkgdesc="Embedded Lua templates for Lua 5.2"
	depends=('lua52')

	_package 5.2
}

package_lua51-etlua(){
	pkgdesc="Embedded Lua templates for Lua 5.1"
	depends=('lua51')

	_package 5.1
}

sha512sums=(
'132a5d7d898b791242abc3b95f47f534d0b0e2a3f9848efb95be04f92049b18c919af8c2ac162e11f78b502d346e78a73935c1ad720f5ffbb1efe90355b39a9a'
)
