# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.8.3
pkgrel=1
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('x86_64')
license=('GPL2')
url="https://docs.xfce.org/panel-plugins/xfce4-datetime-plugin"
depends=('xfce4-panel')
makedepends=('intltool')
install=$pkgname.install
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('6b2eeb79fb586868737426cbd2a4cd43c7f8c58507d8a2f578e0150187cc00b0')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
