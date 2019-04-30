# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.7.1
pkgrel=1
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('x86_64')
license=('GPL2')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('e0c7321346ded2539c4688c593f650696ed0ddca0a5f9d4e404d0e7fc42ae256')

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
