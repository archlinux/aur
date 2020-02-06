# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=vstruct
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.0.2
_gittag=5ddf751b923f41be3dbb832d9a2df1c6055c26f3
_rockrel=1
pkgrel=2
pkgdesc='Lua library to manipulate binary data'
arch=('i686' 'x86_64')
url='https://github.com/ToxicFrog/vstruct'
license=('MIT')
makedepends=('luarocks')
# source=("${_rockname}-$pkgver.tar.gz::https://github.com/ToxicFrog/$_rockname/archive/$pkgver.tar.gz")
source=("${_rockname}-$_gittag.tar.gz::https://github.com/ToxicFrog/$_rockname/archive/$_gittag.tar.gz")
sha256sums=('41c18a2e15c1107319b848a20d1769d1f2fb4ac7036f71c71ce1e0fdb9426cc3')

_package_helper() {
  # cd "$_rockname-$pkgver"
  cd "$_rockname-$_gittag"
  luarocks --lua-version=$1 --tree="$pkgdir/usr" install --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-vstruct() {
  depends+=('lua')
  _package_helper 5.3
}

package_lua52-vstruct() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-vstruct() {
  depends+=('lua51')
  _package_helper 5.1
}
