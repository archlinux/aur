# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=term
_pkgname=lua-$_rockname
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.7
_pkgver=0.07
_rockrel=1
pkgrel=4
pkgdesc='Terminal functions for Lua'
arch=('i686' 'x86_64')
url="https://github.com/hoelzro/$_pkgname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/hoelzro/$_pkgname/archive/$_pkgver.tar.gz")
sha256sums=('c1a1d0c57107147ea02878a50b768d1c3c13aca2769b026c5bb7a84119607f30')

_package_helper() {
  cd "$_pkgname-$_pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_pkgname-$pkgver-$_rockrel.rockspec"
}

package_lua-term() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-term() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-term() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-term() {
  depends+=('lua51')
  _package_helper 5.1
}
