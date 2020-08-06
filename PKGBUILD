# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=path
pkgbase="lua-$_rockname"
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.3.1
_rockrel=1
pkgrel=4
pkgdesc='File system path manipulation library'
arch=('i686' 'x86_64')
url="https://github.com/moteus/$pkgbase"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f7419d9012cb5005a9adbc6e567fee44832a42a73532451336de066ff2ebcce5')

_package_helper() {
  cd "$pkgbase-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspecs/$pkgbase-$pkgver-$_rockrel.rockspec"
}

package_lua-path() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-path() {
  depends+=('lua53')
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
