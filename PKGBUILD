# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-system-log
pkgver=3.8.1
pkgrel=1
pkgdesc="View your system logs"
arch=(i686 x86_64)
url="http://gnome.org"
license=('GPL2')
depends=('dconf' 'gtk3')
makedepends=('intltool' 'itstool' 'docbook-xsl')
groups=('gnome')
install=$pkgname.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('2393d00e059212b5a1135589d11412c0639fe9e60958ccff1bac238139dd4967')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --disable-schemas-compile
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
