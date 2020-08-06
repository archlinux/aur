# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cosmo
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=16.06.04
_rockrel=1
pkgrel=4
pkgdesc='Safe templates for Lua'
arch=('i686' 'x86_64')
url='http://cosmo.luaforge.net/'
license=('MIT')
_lua_deps=('lpeg')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/mascarenhas/$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('86d17aea5080a90671d965cffeb9b104c19e0e1ea55c08687c0924c4512b52b1')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspec/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-cosmo() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-cosmo() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-cosmo() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-cosmo() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
