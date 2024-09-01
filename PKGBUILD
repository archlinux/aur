# Maintainer Matias Vazquez-Levi <matiasvlevi@gmail.com>

pkgname=lu5
pkgver=0.1.6
pkgrel=4
pkgdesc="Lua interpreter for Creative Coding"
arch=('x86_64')
url="https://github.com/matiasvlevi/lu5"
license=('MIT')
depends=('lua' 'glfw' 'glu' 'freetype2')

source=("git+https://github.com/matiasvlevi/lu5.git#tag=v$pkgver"
        "git+https://github.com/matiasvlevi/lua.git")

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.lua.url "$srcdir/lua"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  sudo make install
}
sha256sums=('9ceceecc8e648b5ff7eaa928226756405667d0a901d7a527a26082037adc305e'
            'SKIP')
