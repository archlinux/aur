# Maintainer: John Regan <john@jrjrtech.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-ansicolors' 'lua51-ansicolors' 'lua52-ansicolors' 'lua53-ansicolors' 'lua54-ansicolors')
_lua_next=5.6
_lua_cur=5.5
_rockname=ansicolors
_rockver=1.0
pkgver=1.0.2
pkgrel=2
pkgdesc="ANSI terminal color manipulation for Lua"
arch=('any')
url='https://github.com/kikito/ansicolors.lua'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fa76a465c2e0d342f6d5a1d44c63bd398053f206f41c7b5356b551694f899d64')

_package() {
  LUA_V=${1}
  install -Dm644 ansicolors.lua-${pkgver}/ansicolors.lua "${pkgdir}/usr/share/lua/${LUA_V}/ansicolors.lua"
  install -Dm644 ansicolors.lua-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lua-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.5'
  depends=("lua>=${_lua_cur}" "lua<${_lua_next}")

  _package 5.5
}

package_lua51-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.1'
  depends=('lua51')

  _package 5.1
}

package_lua52-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.2'
  depends=('lua52')
  
  _package 5.2
}

package_lua53-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.3'
  depends=('lua53')
  
  _package 5.3
}

package_lua54-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.4'
  depends=('lua54')
  
  _package 5.4
}
