# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-busted
pkgver=2.0.rc3
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
        'lua-ansicolors'
        'lua-penlight'
        'lua-mediator')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('bfe8e672528bf8b062c20a64f607bf3a6c46cf28c1d8ab7eae6812e41d64e183')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
