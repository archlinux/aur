# Maintainer: jxir <aur@jxir.de>

pkgname=lua-wcwidth
pkgver=0.5
pkgrel=3
pkgdesc="Pure Lua implementation of the wcwidth() function"
arch=('any')
url="https://github.com/aperezdc/lua-wcwidth"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aperezdc/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('79b2969be5ab60e01fc579c955c7ef615cba5410f65f2329f99d25d1154b88e4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  luarocks --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "luarocks/wcwidth-$pkgver-1.rockspec"
}
