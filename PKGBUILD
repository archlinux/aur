# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-resty-mpd' 'lua51-resty-mpd' 'lua52-resty-mpd' 'lua53-resty-mpd' 'lua54-resty-mpd')
_pkgbase='lua-resty-mpd'
pkgver=5.2.3
pkgrel=2
arch=('any')
url='https://github.com/jprjr/lua-resty-mpd/'
license=('MIT')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")

_lua_cur=5.5
_lua_next=5.6

_package() {
    LUA_V=$1

    cd "$_pkgbase-$pkgver/src"

    find resty -type d | while read dir ; do
      if test -n "$(find $dir -name '*.lua' -print -quit)" ; then
          install -Dm755 -d "$pkgdir/usr/share/lua/${LUA_VERSION}/$dir"
          install -Dm644 $dir/*.lua "$pkgdir/usr/share/lua/${LUA_VERSION}/$dir/"
      fi
    done
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-resty-mpd() {
    pkgdesc="A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua ${_lua_cur}"
    depends=("lua>=${_lua_cur}" "lua<${_lua_next}")
    optdepends=('lua-cqueues'
                'lua-socket')

    _package ${_lua_cur}
}

package_lua54-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.4'
    depends=('lua54')
    optdepends=('lua54-cqueues'
                'lua54-socket')

    _package 5.4
}

package_lua53-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.3'
    depends=('lua53')
    optdepends=('lua53-cqueues'
                'lua53-socket')

    _package 5.3
}

package_lua52-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.2'
    depends=('lua52')
    optdepends=('lua52-cqueues'
                'lua52-socket')

    _package 5.2
}


package_lua51-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.1'
    depends=('lua51')
    optdepends=('lua51-cqueues'
                'lua51-socket')

    _package 5.1
}

sha512sums=(
'936c2feb880086c781b829d39c62c6a8340db3aae5141afc356070c892e49f148e2d5702237b42e7c876473b78556956bfb4c4af1fef59d0e1671119dd210dce'
)
