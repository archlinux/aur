# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-inifile
_rockname=inifile
pkgver=1.0
pkgrel=1
pkgdesc="Inifile is a simple, complete ini parser for lua"
arch=('i686' 'x86_64')
url="http://docs.bartbes.com/inifile"
license=('BSD')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${pkgver}.tar.gz::https://github.com/bartbes/inifile/archive/v${pkgver}.tar.gz")
md5sums=('33e5b3e8eb9f4e2430cfb548e6f6d6fe')

build() {
  cd "$_rockname-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none "$_rockname-$pkgver-2.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-$pkgver"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
