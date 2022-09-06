# Maintainer:  twa022 <twa022 at gmil dot com>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

pkgname=xfce4-windowck-plugin
epoch=1
pkgver=0.5.0
pkgrel=1
pkgdesc="Xfce panel plugin for displaying window title and buttons"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/panel-plugins/xfce4-windowck-plugin/"
license=('GPL3')
depends=('xfce4-panel' 'libwnck3')
makedepends=('intltool' 'xfce4-dev-tools' 'python')
options=('!libtool')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('0dfae15505d66a4cbafe4acdbc0896f082adadbda7cb5b03966fefc6ad0d8050')

build() {
  cd "${pkgname}-v${pkgver}"
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd "${pkgname}-v${pkgver}"
  make DESTDIR="$pkgdir" install
}
