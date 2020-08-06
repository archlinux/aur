# Maintainer: Stephen Smith <stephen304@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=coxpcall
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=1.16.0
_rockrel=1
_tag=${pkgver//./_}
pkgrel=3
pkgdesc='Encapsulates the protected calls with a coroutine based loop'
arch=('any')
url="https://keplerproject.github.io/$_rockname"
license=('MIT')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$_tag.tar.gz::https://github.com/keplerproject/$_rockname/archive/v$_tag.tar.gz")
sha256sums=('b732add4d8c2c56d82a176cf38c11ff1b799c02f220cb29dcd332b91adc34b16')

_package_helper() {
  cd "$_rockname-$_tag"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "rockspec/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-coxpcall() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-coxpcall() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-coxpcall() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-coxpcall() {
  depends+=('lua51')
  _package_helper 5.1
}
