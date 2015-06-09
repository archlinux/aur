# Maintainer: TingPing <tingping@tingping.se>

pkgname=hexchat-lua-git
pkgver=32.eda6cba
pkgrel=1
pkgdesc="Lua plugin for scripts"
arch=('i686' 'x86_64')
url='https://github.com/hexchat/hexchat-addons'
license=('GPL')
depends=('lua51' 'hexchat')
makedepends=('git')
optdepends=()
options=()
install=
source=('git://github.com/hexchat/hexchat-addons.git')
md5sums=('SKIP')
_gitname='hexchat-addons'

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname/c/lua"
  make
}

package() {
  cd "$srcdir/$_gitname/c/lua"
  install -D lua.so "$pkgdir/usr/lib/hexchat/plugins/lua.so"
}

