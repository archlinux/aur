# Maintainer: Zetta1 Reid0

pkgname=xfdesktop-nothunar
pkgver=4.18.1
pkgrel=1
pkgdesc="Xfce's desktop manager (Thunar Disabled)"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck3' 'exo' 'garcon' 'hicolor-icon-theme')
makedepends=('intltool')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('ef9268190c25877e22a9ff5aa31cc8ede120239cb0dfca080c174e7eed4ff756')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-notifications \
    --disable-debug \
    --disable-desktop-icons
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
