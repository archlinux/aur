# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lub
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.1.0
_rockrel=1
pkgrel=4
pkgdesc='Lubyk base module'
arch=('i686' 'x86_64')
url="https://lubyk.github.io/lubyk/$_rockname.html"
license=('MIT')
_lua_deps=('filesystem')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/lubyk/$_rockname/archive/REL-$pkgver.tar.gz")
sha256sums=('355f427f28155c4cf3a9673aa24c3754ea782c1c5f2081cbc4c28c00ed69a0b7')

_package_helper() {
  cd "$_rockname-REL-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-lub() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-lub() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-lub() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-lub() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
