# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=xfce4-statusnotifier-plugin
pkgver=0.2.0
pkgrel=1
pkgdesc="Plugin to status notifier indicators in the Xfce4 panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-statusnotifier-plugin"
license=('GPL')
depends=('xfce4-panel' 'libdbusmenu-gtk3')
makedepends=('intltool' 'python') # for gdbus-codegen
source=(http://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('65c8af58f24a44fbd2e9186c57295641be3ed2a816dc86405fb7380ec69360c1')

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
