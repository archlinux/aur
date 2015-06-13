# Maintainer: Dwayne Bent <dbb@dbb.io>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=lua51-event
_pkgbase=luaevent
pkgver=0.4.3
pkgrel=3
pkgdesc="libevent binding for Lua"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/harningt/luaevent"
license=('LGPL2.1')
makedepends=('lua51' 'lua51-socket')
depends=('libevent>=1.4')
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/harningt/${_pkgbase}/archive/v${pkgver}.tar.gz)
sha512sums=('5f02c9d40e59589a2b932b49d27230ca6650174feeda2cf412769c33af056c9df52d38fdd5fc12f0f6318b788e29a2deef54f11beb4becc48818edd27185f161')

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

