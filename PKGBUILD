# Maintainer: SCDevel <root@scdevel.net>
pkgname=luaaa-git
pkgver=0.2.3.r0.g1654818
pkgrel=1
pkgdesc="C++ to LUA binding tool in a single header file."
url="https://github.com/gengyong/luaaa"
license=("MIT")
arch=(any)
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ${pkgname%-git}.hpp "$pkgdir/usr/include/${pkgname%-git}.hpp"
}
