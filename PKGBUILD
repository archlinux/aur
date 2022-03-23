# Maintainer:  twa022 <twa022 at gmail dot com>

pkgname=xfce4-indicator-plugin
pkgver=2.4.1
pkgrel=1
pkgdesc="Plugin to display information from applications in the Xfce4 panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://docs.xfce.org/panel-plugins/xfce4-indicator-plugin/start'
license=('GPL')
depends=('hicolor-icon-theme' 'libindicator-gtk3' 'xfce4-panel' 'xdg-utils')
makedepends=('intltool')
source=(https://archive.xfce.org/src/panel-plugins/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('926af0930417ebb45f3acc71b6bee66cc21593c79ec0ca9e8782147e6c50f020')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
