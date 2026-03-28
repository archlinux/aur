# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-irc-formatter' 'lua51-irc-formatter' 'lua52-irc-formatter' 'lua53-irc-formatter' 'lua54-irc-formatter')
pkgdesc='A simple formatter/serializer for IRC messages.'
_pkgname='irc-formatter'
pkgver=1.1.1
pkgrel=2
arch=('any')
url='https://github.com/jprjr/lua-irc-formatter'
license=('MIT')
source=("$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")

_lua_cur=5.5
_lua_next=5.6

_package() {
    LUA_V=$1

    cd "$_pkgname-$pkgver"
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
'd5e1acef347e251cda77209eadd3c45f0125c527a39708a6496d8add7c690cd57f2bcb799500dc43aeefabbf7af23bc08fa30e252d290142b05a4d9c167e5384'
)
