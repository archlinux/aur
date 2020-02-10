# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luacov-coveralls
pkgname=lua-$_rockname
pkgver=0.2.2
_rockrel=1
pkgrel=3
pkgdesc='LuaCov reporter for coveralls.io service'
arch=('i686' 'x86_64')
url="https://github.com/moteus/$_rockname"
license=('MIT')
depends=('lua' 'lua-luacov')
makedepends=('luarocks')
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/moteus/$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('6534d446b6f7e5d2e7628210e7466df9f213c83dbf957beaa93e48f8261e9ed2')

package() {
  cd "$_rockname-$pkgver"
  luarocks --tree="$pkgdir/usr/" make --deps-mode=none "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}
