# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=gnome-system-log
pkgver=3.3.92
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
sha256sums=('316d897c73bd24b5637811ee31402e043f5e1e7ccd1ba2914e7470d1ac87487b')

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
