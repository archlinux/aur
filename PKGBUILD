# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

_rockname=linenoise
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.9
_rockrel=1
pkgrel=2
pkgdesc='A binding for the linenoise command line library'
arch=('x86_64' 'i686')
url='https://github.com/hoelzro/lua-linenoise'
license=('MIT/X11')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/hoelzro/lua-$_rockname/archive/$pkgver.tar.gz")
sha256sums=('cc1cdb4047edd056a10dcdeec853dbaf5088e2202941d579e4592584d733f09c')

_package_helper() {
  cd "lua-$_rockname-$pkgver"
  luarocks --lua-version=$1 --tree="$pkgdir/usr" install --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}

package_lua-linenoise() {
  depends+=('lua')
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
