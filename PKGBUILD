# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=vstruct
pkgname=lua-$_rockname
pkgver=2.0.2
_rockrel=1
pkgrel=1
pkgdesc="Lua library to manipulate binary data"
arch=('i686' 'x86_64')
url="https://github.com/ToxicFrog/vstruct"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('74938d4e51c19ede701a4f52abbcd498ad8ee0179393cb6e01177b81fee043fd')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
