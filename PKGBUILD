# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-lapis' 'lua51-lapis' 'lua52-lapis' 'lua53-lapis' 'lua54-lapis')
_pkgbase='lapis'
pkgver=1.17.0
pkgrel=1
arch=('any')
url='https://github.com/leafo/lapis'
license=('MIT')
_lua_current=5.5
_lua_next=5.6
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

_package() {
    LUA_VERSION=$1

    cd "$_pkgbase-$pkgver"
    find lapis -type d | while read dir ; do
      if test -n "$(find $dir -name '*.lua' -print -quit)" ; then
        install -Dm755 -d "$pkgdir/usr/share/lua/${LUA_VERSION}/$dir"
        install -Dm644 $dir/*.lua "$pkgdir/usr/share/lua/${LUA_VERSION}/$dir/"
      fi
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-lapis() {
    pkgdesc='A web framework for MoonScript & Lua 5.5'
    depends=("lua>=${_lua_current}" "lua<${_lua_next}")
    depends+=('lua-ansicolors')
    depends+=('lua-argparse')
    depends+=('lua-cjson')
    depends+=('lua-date')
    depends+=('lua-etlua')
    depends+=('lua-loadkit')
    depends+=('lua-lpeg')
    depends+=('lua-luaossl')
    depends+=('lua-pgmoon')
    depends+=('lua-socket')

    _package ${_lua_current}
    install -Dm755 bin/lapis "$pkgdir/usr/bin/lapis"
}

package_lua51-lapis() {
    pkgdesc='A web framework for MoonScript & Lua 5.1'
    depends=('lua51')
    depends+=('lua51-ansicolors')
    depends+=('lua51-argparse')
    depends+=('lua51-cjson')
    depends+=('lua51-date')
    depends+=('lua51-etlua')
    depends+=('lua51-loadkit')
    depends+=('lua51-lpeg')
    depends+=('lua51-luaossl')
    depends+=('lua51-pgmoon')
    depends+=('lua51-socket')

    _package 5.1
}

package_lua52-lapis() {
    pkgdesc='A web framework for MoonScript & Lua 5.2'
    depends=('lua52')
    depends+=('lua52-ansicolors')
    depends+=('lua52-argparse')
    depends+=('lua52-cjson')
    depends+=('lua52-date')
    depends+=('lua52-etlua')
    depends+=('lua52-loadkit')
    depends+=('lua52-lpeg')
    depends+=('lua52-luaossl')
    depends+=('lua52-pgmoon')
    depends+=('lua52-socket')

    _package 5.2
}

package_lua53-lapis() {
    pkgdesc='A web framework for MoonScript & Lua 5.3'
    depends=('lua53')
    depends+=('lua53-ansicolors')
    depends+=('lua53-argparse')
    depends+=('lua53-cjson')
    depends+=('lua53-date')
    depends+=('lua53-etlua')
    depends+=('lua53-loadkit')
    depends+=('lua53-lpeg')
    depends+=('lua53-luaossl')
    depends+=('lua53-pgmoon')
    depends+=('lua53-socket')

    _package 5.3
}

package_lua54-lapis() {
    pkgdesc='A web framework for MoonScript & Lua 5.4'
    depends=('lua54')
    depends+=('lua54-ansicolors')
    depends+=('lua54-argparse')
    depends+=('lua54-cjson')
    depends+=('lua54-date')
    depends+=('lua54-etlua')
    depends+=('lua54-loadkit')
    depends+=('lua54-lpeg')
    depends+=('lua54-luaossl')
    depends+=('lua54-pgmoon')
    depends+=('lua54-socket')

    _package 5.4
}

sha512sums=(
'90a2f8a94b2efd9f731cb052c40c62a0086d965f713ca44bb06f772b12067717527e615394e6ea8d7a277edadf9d5344f9ae7d912579c616a726f1cf09010aeb'
)
