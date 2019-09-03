# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
pkgname=lua-$_rockname
pkgver=2.2
_rockrel=0
pkgrel=1
pkgdesc="The cassowary constraint solver."
arch=('i686' 'x86_64')
url="https://github.com/simoncozens/cassowary.lua"
license=('MIT')
depends=('lua' 'lua-penlight')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('cfe38de6efba0fcfc34f630f75fbd803ac2a70361297547a9d98d959c20b383f')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
