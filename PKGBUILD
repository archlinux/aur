# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.8.2
pkgrel=1
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('x86_64')
license=('GPL2')
url="https://docs.xfce.org/panel-plugins/xfce4-datetime-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('6c388cc457015f629fecf546f1ee815d7c12e29576718f19bea5d496a8d7e037')

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
