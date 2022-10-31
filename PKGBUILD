# Maintainer:  twa022 <twa022 at gmil dot com>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

pkgname=xfce4-windowck-plugin
epoch=1
pkgver=0.5.1
pkgrel=1
pkgdesc="Xfce panel plugin for displaying window title and buttons"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/panel-plugins/xfce4-windowck-plugin"
license=('GPL3')
depends=('xfce4-panel' 'libwnck3')
makedepends=('intltool' 'xfce4-dev-tools' 'python')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/${pkgname}-${pkgver}/${pkgname}-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('b52d57e3f3ad2a1b694321d50cdc39bcedaa1a88409cef08ec3aecb86762f7fc')

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
