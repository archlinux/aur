# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=fluent
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.0.4
_rockrel=0
pkgrel=7
pkgdesc='Lua implementation of Project Fluent'
arch=('any')
url="https://github.com/alerque/$_project"
license=('MIT')
_lua_deps=('cldr' 'luaepnf' 'penlight')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('90705d64e4bc35d204604601e65094da49ca14c41e43110da778c1e3166346b5')

_package_helper() {
  cd "$_project-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
}

package_lua-fluent() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-fluent() {
  depends=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-fluent() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-fluent() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
