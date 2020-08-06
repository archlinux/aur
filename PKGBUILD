# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lua_cliargs
pkgname=('lua-cliargs' 'lua53-cliargs' 'lua52-cliargs' 'lua51-cliargs')
pkgver=3.0
_rockrel=2
pkgrel=5
pkgdesc='A command-line argument parser'
arch=('any')
url="https://github.com/amireh/$_rockname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/v$pkgver-$_rockrel.tar.gz")
sha256sums=('971d6f1440a55bdf9db581d4b2bcbf472a301d76f696a0d0ed9423957c7d176e')

_package_helper() {
  cd "$_rockname-$pkgver-$_rockrel"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-cliargs() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-cliargs() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-cliargs() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-cliargs() {
  depends+=('lua51')
  _package_helper 5.1
}
