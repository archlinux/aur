# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=yaml
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.1.2
_rockrel=1
pkgrel=4
pkgdesc='LibYAML binding for Lua'
arch=('i686' 'x86_64')
url="https://lubyk.github.io/lubyk/$_rockname.html"
license=('MIT')
_lua_deps=('lub')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/lubyk/$_rockname/archive/REL-$pkgver.tar.gz")
sha256sums=('b4391d182677ab644403bf1ac028c7421c2605db124f9792193013c582a273ec')

_package_helper() {
  cd "$_rockname-REL-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-yaml() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-yaml() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-yaml() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-yaml() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
