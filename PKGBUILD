# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=xfce4-statusnotifier-plugin
pkgver=0.1.0
pkgrel=1
pkgdesc="Plugin to status notifier indicators in the Xfce4 panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-statusnotifier-plugin"
license=('GPL')
depends=('xfce4-panel' 'libdbusmenu-gtk3')
makedepends=('intltool')
source=(http://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('22ad14101df914e79d4dbd8e5d96382b1d3f52e326d2acd7760bfbf9795ea6d5')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
