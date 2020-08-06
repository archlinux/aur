# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=commonmark
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.0.0
_rockrel=0
pkgrel=4
pkgdesc='Lua parser for CommonMark using LPEG grammar'
arch=('any')
url="https://github.com/alerque/$_project"
license=('MIT')
_lua_deps=('luaepnf' 'penlight')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('509348d55082bcd010b6288e94990f4cb27844625a0a53d85adbd8ff9cdbeb2c')

_package_helper() {
  cd "$_project-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
}

package_lua-commonmark() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.4
}

package_lua53-commonmark() {
  depends=('lua53' "${_lua_deps[@]/#/lua53-}")
  _package_helper 5.3
}

package_lua52-commonmark() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-commonmark() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
