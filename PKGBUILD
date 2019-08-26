# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

_rockname=linenoise
pkgname=lua-$_rockname
pkgver=0.9
_rockrel=1
pkgrel=1
pkgdesc='A binding for the linenoise command line library'
arch=('x86_64' 'i686')
url='https://github.com/hoelzro/lua-linenoise'
license=('MIT/X11')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('e4f942e0079092993832cf6e78a1f019dad5d8d659b9506692d718d0c0432c72')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
