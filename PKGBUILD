# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luautf8
_pkgname=utf8
pkgname=("lua-$_pkgname" "lua53-$_pkgname" "lua52-$_pkgname" "lua51-$_pkgname")
pkgver=0.1.3
_rockrel=1
pkgrel=1
pkgdesc='Add UTF-8 support to Lua, compatible with Lua string module'
arch=('x86_64')
url="https://github.com/starwing/$_rockname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('208b3423a03a6c2822a2fa6b7cc8092ed7d3c0d792ec12c7cd28d6afaa442e0b')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-utf8() {
  depends=('lua')
  _package_helper 5.4
}

package_lua53-utf8() {
  depends=('lua53')
  _package_helper 5.3
}

package_lua52-utf8() {
  depends=('lua52')
  _package_helper 5.2
}

package_lua51-utf8() {
  depends=('lua51')
  _package_helper 5.1
}
