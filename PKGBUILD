# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stephen Smith <stephen304@gmail.com>

_rockname=bit32
pkgname=("lua51-$_rockname" "lua52-$_rockname")
pkgbase=lua-$_rockname
pkgver=5.3.0
_rockrel=1
pkgrel=6
pkgdesc='Lua 5.2 bit manipulation library'
arch=('i686' 'x86_64')
url='https://www.lua.org/manual/5.2/manual.html#6.7'
license=('MIT')
makedepends=('luarocks' 'lua52' 'lua51')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/keplerproject/lua-compat-5.2/archive/bitlib-${pkgver}.tar.gz")
sha256sums=('dc1197b9e996b7bd2c6a679b86ed75106d5722424b3e731b8084f56626ec5552')

_package_helper() {
  cd "lua-compat-5.2-bitlib-$pkgver"
  luarocks --lua-version=$1 --tree="$pkgdir/usr/" install --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua52-bit32() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-bit32() {
  depends+=('lua51')
  _package_helper 5.1
}
