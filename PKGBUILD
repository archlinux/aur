# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=vstruct
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.1.1
_rockrel=1
pkgrel=1
pkgdesc='Lua library to manipulate binary data'
arch=('i686' 'x86_64')
url="https://github.com/ToxicFrog/$_rockname"
license=('MIT')
makedepends=('luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('029ae887fc3c59279f378a499741811976d90f9a806569a42f4de80ad349f333')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
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
