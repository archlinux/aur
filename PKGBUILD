# Maintainer: jxir <aur@jxir.de>

pkgname=lua-wcwidth
pkgver=0.3
pkgrel=1
pkgdesc="Pure Lua implementation of the wcwidth() function"
arch=('any')
url="https://github.com/aperezdc/lua-wcwidth"
license=('custom')
depends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aperezdc/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6af4384b73815b32d762158d0bb326d9b2f860d5c55088b6b6861f3a57e549ad')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  luarocks make --pack-binary-rock --deps-mode=none luarocks/wcwidth-$pkgver-1.rockspec
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none wcwidth-$pkgver-1.all.rock
}
