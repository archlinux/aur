# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-system-log
pkgver=3.9.90
pkgrel=2
pkgdesc="View your system logs"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/gnome-system-log"
license=('GPL2')
depends=('dconf' 'gtk3')
makedepends=('intltool' 'itstool' 'docbook-xsl')
groups=('gnome')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('9eeb51982d347aa7b33703031e2c1d8084201374665425cd62199649b29a5411')

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
