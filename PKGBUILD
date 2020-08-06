# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=say
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.3
_rockrel=1
pkgrel=6
pkgdesc='Lua String Hashing/Indexing Library'
arch=('any')
url="https://github.com/Olivine-Labs/$_rockname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver-$_rockrel.tar.gz")
sha256sums=('23e8cd378bb4ab1693279100a785acb2246418e3570b7de7d995b5847b3507ca')

_package_helper() {
  cd "$_rockname-$pkgver-$_rockrel"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-say() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-say() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-say() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-say() {
  depends+=('lua51')
  _package_helper 5.1
}
