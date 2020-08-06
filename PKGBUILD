# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=mediator
_pkgname=mediator_lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgname=lua-mediator
pkgver=1.1.2
_rockrel=0
pkgrel=4
pkgdesc='Event handling through channels'
arch=('any')
url="https://olivinelabs.com/$_pkgname/"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/Olivine-Labs/$_pkgname/archive/v$pkgver-$_rockrel.tar.gz")
sha256sums=('faf5859fd2081be4e9e4fb8873a2dc65f7eff3fd93d6dd14da65f8e123fcff9b')

_package_helper() {
  cd "$_pkgname-$pkgver-$_rockrel"
  luarocks --lua-version=$1 --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_pkgname-$pkgver-$_rockrel.rockspec"
}

package_lua-mediator() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-mediator() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-mediator() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-mediator() {
  depends+=('lua51')
  _package_helper 5.1
}
