# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-irc-formatter' 'lua51-irc-formatter' 'lua52-irc-formatter' 'lua53-irc-formatter' 'lua54-irc-formatter')
pkgdesc='A simple formatter/serializer for IRC messages.'
_pkgname='lua-irc-formatter'
pkgver=1.1.1
pkgrel=3
arch=('any')
url='https://buffering.party/software/lua-irc-formatter/'
license=('MIT')
source=("${url}lua-irc-formatter-v${pkgver}.tar.gz")

_lua_cur=5.5
_lua_next=5.6

_package() {
    LUA_V=$1

    cd "$_pkgname"
    install -Dm644 src/irc-formatter.lua "$pkgdir/usr/share/lua/$LUA_V/irc-formatter.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-irc-formatter() {
    pkgdesc="A simple formatter/serializer for IRC messages for Lua ${_lua_cur}"
    depends=("lua<${_lua_next}" "lua>=${_lua_cur}")

    _package $_lua_cur
}

package_lua54-irc-formatter() {
    pkgdesc="A simple formatter/serializer for IRC messages for Lua 5.4"
    depends=('lua54')

    _package 5.4
}

package_lua53-irc-formatter() {
    pkgdesc="A simple formatter/serializer for IRC messages for Lua 5.3"
    depends=('lua53')

    _package 5.3
}

package_lua52-irc-formatter() {
    pkgdesc="A simple formatter/serializer for IRC messages for Lua 5.2"
    depends=('lua52')

    _package 5.2
}

package_lua51-irc-formatter() {
    pkgdesc="A simple formatter/serializer for IRC messages for Lua 5.1"
    depends=('lua51')

    _package 5.1
}

sha512sums=(
'ac9ab46fa46e9e7d3710f98ed9074a18b53b7ee3f7da4bca61add6e91fda5e3f22671079d3909b45d40fac9f5842267ceaad02b3d9459f036a6f4c6417716a7d'
)
