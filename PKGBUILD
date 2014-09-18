# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.6.2
pkgrel=3
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(http://archive.xfce.org/src/panel-plugins/$pkgname/0.6/$pkgname-$pkgver.tar.bz2)
sha256sums=('9734da671e8d1d7de5fae92093a05d653c9245b838542fb9aff3e10368cc9e2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
