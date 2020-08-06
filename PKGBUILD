# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

_rockname=linenoise
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
_pkgname=lua-$_rockname
pkgver=0.9
_rockrel=1
pkgrel=5
pkgdesc='A binding for the linenoise command line library'
arch=('x86_64' 'i686')
url="https://github.com/hoelzro/$_pkgname"
license=('MIT/X11')
makedepends=('lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cc1cdb4047edd056a10dcdeec853dbaf5088e2202941d579e4592584d733f09c')

_package_helper() {
  cd "$_pkgname-$pkgver"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua-linenoise() {
  depends+=('lua')
  _package_helper 5.4
}

package_lua53-linenoise() {
  depends+=('lua53')
  _package_helper 5.3
}

package_lua52-linenoise() {
  depends+=('lua52')
  _package_helper 5.2
}

package_lua51-linenoise() {
  depends+=('lua51')
  _package_helper 5.1
}
