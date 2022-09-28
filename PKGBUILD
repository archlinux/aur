# Maintainer: Dwayne Bent <dbb@dbb.io>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=(lua-event lua51-event lua52-event lua53-event)
_pkgbase=luaevent
pkgver=0.4.6
pkgrel=2
pkgdesc="libevent binding for Lua"
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/harningt/luaevent"
license=('MIT')
makedepends=('libevent' 'lua51' 'lua52' 'lua53' 'lua')
source=($_pkgbase-$pkgver.tar.gz::https://github.com/harningt/$_pkgbase/archive/v$pkgver.tar.gz)
sha256sums=('dd12babb252115895618c1243557534decde289bf0c255ffebf0dcd14a18705d')

# There is no build directory because the Makefile doesn’t allow for separating
# both steps, see https://github.com/harningt/luaevent/issues/11

package_lua-event() {
  depends=('libevent' 'lua-socket')

  cd $_pkgbase-$pkgver
  make LUA_INC_DIR=/usr/include \
       INSTALL_DIR_BIN='/usr/lib/lua/5.4' \
       INSTALL_DIR_LUA='/usr/share/lua/5.4' \
       DESTDIR="$pkgdir" \
       install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua51-event() {
  depends=('libevent' 'lua51-socket')

  cd $_pkgbase-$pkgver
  make LUA_INC_DIR=/usr/include/lua5.1 \
       INSTALL_DIR_BIN='/usr/lib/lua/5.1' \
       INSTALL_DIR_LUA='/usr/share/lua/5.1' \
       DESTDIR="$pkgdir" \
       install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-event() {
  depends=('libevent' 'lua52-socket')

  cd $_pkgbase-$pkgver
  make LUA_INC_DIR=/usr/include/lua5.2 \
       INSTALL_DIR_BIN='/usr/lib/lua/5.2' \
       INSTALL_DIR_LUA='/usr/share/lua/5.2' \
       DESTDIR="$pkgdir" \
       install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua53-event() {
  depends=('libevent' 'lua53-socket')

  cd $_pkgbase-$pkgver
  make LUA_INC_DIR=/usr/include \
       INSTALL_DIR_BIN='/usr/lib/lua/5.3' \
       INSTALL_DIR_LUA='/usr/share/lua/5.3' \
       DESTDIR="$pkgdir" \
       install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

