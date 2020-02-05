# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luaepnf
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.3
_rockrel=1
pkgrel=2
pkgdesc='Extended PEG Notation Format (easy grammars for LPeg)'
arch=('i686' 'x86_64')
url='https://siffiejoe.github.com/lua-luaepnf/'
license=('MIT')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/siffiejoe/lua-$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('57c0ad1917e45c5677bfed0f6122da2baff98117aba05a5e987a0238600f85f9')

_package_helper() {
  cd "lua-$_rockname-$pkgver"
  luarocks --lua-version=$1 --tree="$pkgdir/usr" install --deps-mode=none --no-manifest "$_rockname-scm-0.rockspec"
}

package_lua-luaepnf() {
  depends+=('lua' 'lua-lpeg')
  _package_helper 5.3
}

package_lua52-luaepnf() {
  depends+=('lua52' 'lua52-lpeg')
  _package_helper 5.2
}

package_lua51-luaepnf() {
  depends+=('lua51' 'lua51-lpeg')
  _package_helper 5.1
}
