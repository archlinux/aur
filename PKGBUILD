# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luassert
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.8.0
_rockrel=0
pkgrel=6
pkgdesc='Lua Assertions Extension'
arch=('any')
url='https://olivinelabs.com/busted/'
license=('MIT')
_lua_deps=('say')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/Olivine-Labs/$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('5955234a63fdc208674314b2e97982bb551459b85b8ff11611a50421c6a29c76')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-luassert() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-luassert() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-luassert() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-luassert() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
