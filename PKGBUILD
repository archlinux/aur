# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-resty-mpd' 'lua51-resty-mpd' 'lua52-resty-mpd' 'lua53-resty-mpd' 'lua54-resty-mpd')
_pkgbase='lua-resty-mpd'
pkgver=5.2.3
pkgrel=3
arch=('any')
url='https://buffering.party/software/lua-resty-mpd/'
license=('MIT')
source=("${url}/lua-resty-mpd-${pkgver}.tar.gz")

_lua_cur=5.5
_lua_next=5.6

_package() {
    LUA_V=$1

    cd "$_pkgbase/src"

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
'03f6b552f91078ba8b844d10913f79e62d0d969796d83938664f13249a9735d46b8255f6f2b8c9be468010d7ff2454614b297c5e8728f98e50f66f7f856f7926'
)
