# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=lsqlite3
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.9.5
_fossilver=fsl09y
_rockrel=1
pkgrel=4
pkgdesc='A binding for Lua to the SQLite3 database library'
arch=('i686' 'x86_64')
url='http://lua.sqlite.org'
license=('MIT')
depends=('sqlite')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.zip::http://lua.sqlite.org/index.cgi/zip/lsqlite3_$_fossilver.zip?uuid=${_fossilver/0/_}")
sha256sums=('72498d89056ada0d03a2053224dc887bf7535eb75d006232be14ef7824848818')

_package_helper() {
  cd "${_rockname}_$_fossilver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-lsqlite3() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-lsqlite3() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-lsqlite3() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-lsqlite3() {
  depends+=('lua51')
  _package_helper 5.1
}
