# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Stephen Smith <stephen304@gmail.com>
# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>

_rockname=dkjson
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=2.5
pkgrel=4
_rockrel=2
pkgdesc='David Kolf’s Pure Lua JSON module with UTF-8 support and no external dependencies'
arch=('any')
url="http://dkolf.de/src/$_rockname-lua.fsl/home"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("http://dkolf.de/src/$_rockname-lua.fsl/tarball/$_rockname-$pkgver.tar.gz")
sha256sums=('b469e80daa9f2355c675d9293e831f3f69153e49856c59634db97899121a720d')

_package_helper() {
  cd "$_rockname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-dkjson() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-dkjson() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-dkjson() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-dkjson() {
  depends+=('lua51')
  _package_helper 5.1
}
