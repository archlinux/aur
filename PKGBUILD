# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-system-log
pkgver=3.4.1
pkgrel=1
pkgdesc="View your system logs"
arch=(i686 x86_64)
url="http://gnome.org"
license=('GPL2')
depends=('dconf' 'gtk3')
makedepends=('intltool' 'gnome-doc-utils')
groups=('gnome-extra')
install=$pkgname.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('288bb4db72d5e86874198f3a879a89cd0ddec373db9838d8ea772df1c5267736')

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
