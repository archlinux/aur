# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=std-normalize
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
_pkgname=normalize
pkgver=2.0.2
_rockrel=1
pkgrel=4
pkgdesc="Normalized Lua functions"
arch=('any')
url="https://github.com/lua-stdlib/$_pkgname"
license=('MIT')
_lua_deps=('std-_debug')
makedepends=('luarocks')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/lua-stdlib/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7ca9bc7812a0581f421f29dcb996011575849e4acda3d1683aa27fe4ff8c2687')

_package_helper() {
    cd "$_pkgname-$pkgver"
    luarocks --lua-version="$1" --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "${_rockname/-/.}-$pkgver-$_rockrel.rockspec"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-std-normalize() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  _package_helper 5.3
}

package_lua52-std-normalize() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-std-normalize() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}

