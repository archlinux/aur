# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-busted
pkgver=2.0.rc13
_rockname=busted
_rockrel=0
pkgrel=1
pkgdesc="Elegant Lua unit testing."
arch=('i686' 'x86_64')
url="http://olivinelabs.com/busted/"
license=('MIT')
depends=('lua'
        'lua-cliargs'
        'lua-filesystem'
        'lua-dkjson'
        'lua-say'
        'lua-luassert'
        'lua-term'
        'lua-penlight'
        'lua-mediator')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('05879f7ee08f764411a192402529d03f53e3d7f001cacb8cca051331c2833b43')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
