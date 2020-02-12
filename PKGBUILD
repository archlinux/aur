# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=std-_debug
pkgbase=lua-$_rockname
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
_pkgname=_debug
pkgver=1.0.1
pkgrel=2
_rockrel=1
pkgdesc="Lua Debug Hints Library"
arch=('any')
url="https://github.com/lua-stdlib/$_pkgname"
license=('MIT')
makedepends=('luarocks')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/lua-stdlib/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('efc560540f08dcf880ac48c6ab527bd741bbe3d6d66202a3c8be3ff5c9e1e907')

_package_helper() {
    cd "$_pkgname-$pkgver"
    luarocks --lua-version="$1" --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "${_rockname/-/.}-$pkgver-$_rockrel.rockspec"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-std-_debug() {
  depends+=('lua')
  _package_helper 5.3
}

package_lua52-std-_debug() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-std-_debug() {
  depends+=('lua51')
  _package_helper 5.1
}

