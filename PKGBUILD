# Maintainer:
# Contributor: Rob Hoelz <rob at hoelz dot ro>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

pkgname=lua51-posix
pkgver=33.4.0
pkgrel=1
pkgdesc='POSIX library for Lua 5.1'
arch=('x86_64' 'i686')
url='https://github.com/luaposix/luaposix'
license=('GPL' 'LGPL')
depends=('lua51')
makedepends=('lua51' 'git' 'help2man')
options=('!makeflags')
source=("https://github.com/luaposix/luaposix/archive/release-v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "luaposix-release-v$pkgver"

  LUA=/usr/bin/lua5.1 \
  LUA_INCLUDE=-I/usr/include/lua5.1/ \
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib/lua/5.1 \
      --datadir=/usr/share/lua/5.1 \
      --docdir=/usr/share/doc/lua-posix
  make
}

check() {
  cd "luaposix-release-v$pkgver"
  make check
}

package() {
  cd "luaposix-release-v$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
