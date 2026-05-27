# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-irc-parser' 'lua51-irc-parser' 'lua52-irc-parser' 'lua53-irc-parser' 'lua54-irc-parser')
pkgdesc='An IRC parser for Lua in LPEG, with a Pure-Lua fallback'
_pkgname='irc-parser'
pkgver=1.2.0
pkgrel=5
arch=('any')
url='https://buffering.party/software/lua-irc-parser/'
license=('MIT')
source=("${url}${_pkgname}-${pkgver}.tar.gz")

_lua_cur=5.5
_lua_next=5.6

_package() {
    LUA_V=$1
    cd "$_pkgname-$pkgver"

    install -Dm644 src/irc-parser.lua "$pkgdir/usr/share/lua/$LUA_V/irc-parser.lua"
    install -Dm644 src/irc-parser/fallback.lua "$pkgdir/usr/share/lua/$LUA_V/irc-parser/fallback.lua"
    install -Dm644 src/irc-parser/lpeg.lua "$pkgdir/usr/share/lua/$LUA_V/irc-parser/lpeg.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-irc-parser() {
    pkgdesc="An IRC parser for Lua in LPEG, with a Pure-Lua fallback for Lua ${_lua_cur}"
    depends=("lua<${_lua_next}" "lua>=${_lua_cur}")
    optdepends=('lua-lpeg: faster parsing')

    _package $_lua_cur
}

package_lua54-irc-parser() {
    pkgdesc="An IRC parser for Lua in LPEG, with a Pure-Lua fallback for Lua 5.4"
    depends=('lua54')
    optdepends=('lua54-lpeg: faster parsing')

    _package 5.4
}

package_lua53-irc-parser() {
    pkgdesc="An IRC parser for Lua in LPEG, with a Pure-Lua fallback for Lua 5.3"
    depends=('lua53')
    optdepends=('lua53-lpeg: faster parsing')

    _package 5.3
}

package_lua52-irc-parser() {
    pkgdesc="An IRC parser for Lua in LPEG, with a Pure-Lua fallback for Lua 5.2"
    depends=('lua52')
    optdepends=('lua52-lpeg: faster parsing')

    _package 5.2
}

package_lua51-irc-parser() {
    pkgdesc="An IRC parser for Lua in LPEG, with a Pure-Lua fallback for Lua 5.1"
    depends=('lua51')
    optdepends=('lua51-lpeg: faster parsing')

    _package 5.1
}

sha512sums=(
'16f1bafc176330dca64ee0b27332a9f8364ccbbaa57f9f3f06b4e37ae65f3dadb1953047d0c4cbeb5c2534435146c71f26f0d29a3a817a5b410c5163054cab07'
)
