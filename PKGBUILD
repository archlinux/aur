# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-busted
pkgver=2.0.0
_rockname=busted
_rockrel=1
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
sha256sums=('7cb1d99772b5c7df08f7798ffb0e5b06c392a778f6b1ab923dc6d02e57497c31')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
