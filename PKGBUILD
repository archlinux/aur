# Maintainer Matias Vazquez-Levi <matiasvlevi@gmail.com>

pkgname=lu5
pkgver=0.1.6
pkgrel=4
pkgdesc="Lua interpreter for Creative Coding"
arch=('x86_64')
url="https://github.com/matiasvlevi/lu5"
license=('MIT')
depends=('lua' 'glfw' 'glu' 'freetype2')

source=("$pkgname-$pkgver.tar.gz::https://github.com/matiasvlevi/lu5/archive/refs/tags/v$pkgver.tar.gz"
         lua.tar.gz::https://github.com/matiasvlevi/lua/archive/refs/tags/v5.4.0-b.tar.gz)

prepare() {
  rm -rf $pkgname-$pkgver/include/lua
  mv lua-5.4.0-b $pkgname-$pkgver/include/lua
}


build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  sudo make install
}

sha256sums=('a30ab3cad85e8aba41648aa5ccc47d82b3c2fd1cfab75850e992edc5983652ee'
            '897eb0281bfd9aa30a77a76ebc9acfc6f0cea39b529ead244a472999af98e3be')
