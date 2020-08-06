# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=serpent
_pkgname=lua-serpent
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.28
_rockrel=1
pkgrel=4
pkgdesc='Lua serializer and pretty printer'
arch=('i686' 'x86_64')
url="https://github.com/pkulchenko/$_rockname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('93c35fc1941d300268ba2d4eca4a80a8c9965c789e1150678d7d68158e1f2fef')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "misc/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-serpent() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-serpent() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-serpent() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-serpent() {
  depends+=('lua51')
  _package_helper 5.1
}
