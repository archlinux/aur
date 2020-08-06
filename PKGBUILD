# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=colors
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=8.05.26
_rockrel=1
pkgrel=4
pkgdesc='HSL Color Theory Computation in Lua'
arch=('i686' 'x86_64')
url="http://sputnik.freewisdom.org/lib/$_rockname/"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::http://sputnik.freewisdom.org/files/$_rockname-$pkgver.tar.gz")
sha256sums=('64ec89fb6938cfdadca5ba1dc9c549dc61c62a585bb8ff5ac593b33b709f814b')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspec"
}

package_lua-colors() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-colors() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-colors() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-colors() {
  depends+=('lua51')
  _package_helper 5.1
}
