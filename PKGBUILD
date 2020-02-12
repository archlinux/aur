# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=path
_pkgname=lua-path
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.3.1
_rockrel=1
pkgrel=2
pkgdesc='File system path manipulation library'
arch=('i686' 'x86_64')
url="https://github.com/moteus/$pkgname"
license=('MIT')
makedepends=('luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/moteus/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f7419d9012cb5005a9adbc6e567fee44832a42a73532451336de066ff2ebcce5')

_package_helper() {
  cd "$_pkgname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "rockspecs/$_pkgname-$pkgver-$_rockrel.rockspec"
}

package_lua-path() {
  depends+=('lua')
  _package_helper 5.3
}

package_lua52-path() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-path() {
  depends+=('lua51')
  _package_helper 5.1
}
