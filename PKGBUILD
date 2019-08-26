# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

_rockname=stdlib
pkgname=lua-$_rockname
pkgver=41.2.2
_rockrel=1
pkgrel=1
pkgdesc="Library of modules for common programming tasks"
arch=('i686' 'x86_64')
url="http://github.com/lua-stdlib/lua-stdlib/"
license=('MIT')
depends=('lua' 'lua-penlight')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('c6192597da0bc590f4eb4a5f4df5c5721d9f8c607666341d5a0b695419594c67')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
