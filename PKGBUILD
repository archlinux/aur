# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.2
_rockrel=0
pkgrel=3
pkgdesc="The cassowary constraint solver."
arch=('i686' 'x86_64')
url="https://github.com/simoncozens/cassowary.lua"
license=('MIT')
makedepends=('luarocks')
conflicts=()
source=("https://github.com/simoncozens/$_rockname.lua/archive/v$pkgver.tar.gz")
sha256sums=('e2f7774b6883581491b8f2c9d1655b2136bc24d837a9e43f515590a766ec4afd')

_package_helper() {
  cd "$_rockname.lua-$pkgver"
  luarocks --lua-version=$1 --tree="$pkgdir/usr" install --deps-mode=none --no-manifest "$_rockname-scm-0.rockspec"
}

package_lua-cassowary() {
  depends+=('lua' 'lua-penlight')
  _package_helper 5.3
}

package_lua52-cassowary() {
  depends+=('lua52' 'lua52-penlight')
  _package_helper 5.2
}

package_lua51-cassowary() {
  depends+=('lua51' 'lua51-penlight')
  _package_helper 5.1
}
