# Maintainer:  twa022 <twa022 at gmil dot com>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

pkgname=xfce4-windowck-plugin
epoch=1
pkgver=0.5.1
pkgrel=2
pkgdesc="Xfce panel plugin for displaying window title and buttons"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/panel-plugins/xfce4-windowck-plugin"
license=('GPL3')
depends=('xfce4-panel' 'libwnck3')
makedepends=('intltool' 'python')
options=('!libtool')
source=("https://archive.xfce.org/src/panel-plugins/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a781448b781e984d3bda59b0daab0d184d4cec2252316f7370ac4a98efe481f4')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
