# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_rockname=lpeglabel
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.6.0
_rockrel=1
pkgrel=1
pkgdesc='An extension of LPeg that supports labeled failures'
arch=('x86_64' 'i686')
url="https://github.com/sqmedeiros/lpeglabel"
license=('MIT')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}-${_rockrel}.tar.gz::https://github.com/sqmedeiros/$_rockname/archive/v$pkgver-$_rockrel.tar.gz")
sha256sums=('9bf132b6e55ecd4c3909bb0689cbc43408f8028ccd78872a7e3e0221bba602c4')

_package_helper() {
  cd "$_rockname-$pkgver-$_rockrel"
  luarocks --lua-version=$1 --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-lpeglabel() {
  depends+=('lua')
  _package_helper 5.3
}

package_lua52-lpeglabel() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-lpeglabel() {
  depends+=('lua51')
  _package_helper 5.1
}
