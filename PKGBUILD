# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=lua-posix
pkgver=33.4.0
pkgrel=1
pkgdesc="posix bindings for Lua"
arch=('i686' 'x86_64')
url="https://github.com/luaposix/luaposix#luaposix"
license=('custom')
depends=('lua')
conflicts=('lua-posix-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/luaposix/luaposix/archive/release-v$pkgver.tar.gz")
md5sums=('b36ff049095f28752caeb0b46144516c')

build() {
  cd $srcdir/luaposix-release-v$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $srcdir/luaposix-release-v$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
