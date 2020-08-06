# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=system
_pkgname=luasystem
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.2.1
_rockrel=0
pkgrel=3
pkgdesc='Platform independent system calls for Lua'
arch=('i686' 'x86_64')
url="https://github.com/o-lim/$_pkgname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::https://github.com/o-lim/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0b83f68e9edbba92bef11ec0ccf1e5bb779a7337653f7bb77e0240c8e85c0b94')

_package_helper() {
  cd "$_pkgname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "$_pkgname-$pkgver-$_rockrel.rockspec"
}

package_lua-system() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-system() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-system() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-system() {
  depends+=('lua51')
  _package_helper 5.1
}
