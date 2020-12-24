# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.8.1
pkgrel=1
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('x86_64')
license=('GPL2')
url="https://docs.xfce.org/panel-plugins/xfce4-datetime-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('e9f6f15be29ceb5c45718006b46dbd19b89981617d0768b2ef942b5a70af2540')

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
