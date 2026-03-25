# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-inspect' 'lua51-inspect' 'lua52-inspect' 'lua53-inspect' 'lua54-inspect')
_pkgbase='inspect.lua'
pkgver=3.1.3
pkgrel=2
arch=('any')
url='https://github.com/kikito/inspect.lua'
license=('MIT')
_lua_current=5.5
_lua_next=5.6
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

_package() {
    LUA_VERSION=$1
    LUA_V=${LUA_VERSION//./}

    cd "$_pkgbase-$pkgver"
    install -Dm644 inspect.lua "$pkgdir/usr/share/lua/${LUA_VERSION}/inspect.lua"
    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-inspect() {
    pkgdesc='Human-readable representation of Lua tables'
    depends=("lua>=${_lua_current}" "lua<${_lua_next}")

    _package ${_lua_current}
}

package_lua51-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.1'
    depends=('lua51')

    _package 5.1
}

package_lua52-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.2'
    depends=('lua52')

    _package 5.2
}

package_lua53-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.3'
    depends=('lua53')

    _package 5.3
}

package_lua54-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.4'
    depends=('lua54')

    _package 5.4
}

sha512sums=(
'bc0e93d4c56ce8e5a76d9b19b1376493d2be9e1280cabd8f1251729b2286f711030a13283771ec26e2107131c081d44435dbec70b172313b2493a6e346a1a6fb'
)
