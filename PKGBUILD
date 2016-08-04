# Maintainer: Dwayne Bent <dbb@dbb.io>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=lua51-event
_pkgbase=luaevent
pkgver=0.4.4
pkgrel=1
pkgdesc="libevent binding for Lua"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/harningt/luaevent"
license=('MIT')
makedepends=('lua51' 'lua51-socket')
depends=('libevent>=1.4')
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/harningt/${_pkgbase}/archive/v${pkgver}.tar.gz)
sha256sums=('242c95b9cacd87201aa35ba618eb1cd0b0e2a7d1a8fc6734c0bc06dd742e2455')

build() {
  cd ${_pkgbase}-${pkgver}
  make LUA_INC_DIR=/usr/include/lua5.1
}

package() {
  cd ${_pkgbase}-${pkgver}
  make INSTALL_DIR_BIN='/usr/lib/lua/5.1' \
       INSTALL_DIR_LUA='/usr/share/lua/5.1' \
       DESTDIR="${pkgdir}" \
       install
}

