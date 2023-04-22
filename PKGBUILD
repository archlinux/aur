# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=xfce4-indicator-plugin
pkgver=2.4.2
pkgrel=1
pkgdesc="Plugin to display information from applications in the Xfce4 panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://docs.xfce.org/panel-plugins/xfce4-indicator-plugin/start'
license=('GPL')
depends=('hicolor-icon-theme' 'libayatana-indicator' 'xfce4-panel' 'xdg-utils')
makedepends=('intltool')
source=(https://archive.xfce.org/src/panel-plugins/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('4f50364e4db2993a036244dc18540b061637515ad127769b67d8f7301e2eaa1a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
