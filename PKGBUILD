# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luautf8
_pkgname=utf8
pkgname=("lua-$_pkgname" "lua53-$_pkgname" "lua52-$_pkgname" "lua51-$_pkgname")
pkgver=0.1.2
_rockrel=0
pkgrel=3
pkgdesc='Add UTF-8 support to Lua, compatible with Lua string module'
arch=('x86_64')
url="https://github.com/starwing/$_rockname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('52578858e4519da7e09d019baef9135fef3ff2dfb0bc0a01e58fba7a70f7be26')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspecs/$_rockname-scm-$_rockrel.rockspec"
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
