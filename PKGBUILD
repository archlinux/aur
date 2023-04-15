# Maintainer: bilabila <bilabila@qq.com>
_srcname=LuaFormatter
_pkgname=lua-format
pkgname=$_pkgname
pkgver=1.3.6
pkgrel=7
pkgdesc='LuaFormatter - Code formatter for Lua'
arch=(x86_64 aarch64)
url=https://github.com/Koihik/LuaFormatter
provides=($_pkgname $_srcname)
conflicts=($_pkgname $_srcname)
license=(Apache2)
depends=()
makedepends=(git cmake)
source=('git+https://github.com/Koihik/LuaFormatter#tag=1.3.6')
sha512sums=(SKIP)
prepare() {
  cd $_srcname
  git submodule update --init
}
build() {
  cd $_srcname
  cmake -D BUILD_TESTS=OFF -D COVERAGE=OFF .
  make
}
package() {
  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm755 $_srcname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
