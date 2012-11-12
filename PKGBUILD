# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gnome-system-log
pkgver=3.6.1
pkgrel=1
pkgdesc="View your system logs"
arch=(i686 x86_64)
url="http://gnome.org"
license=('GPL2')
depends=('dconf' 'gtk3')
makedepends=('intltool' 'itstool' 'docbook-xsl')
groups=('gnome-extra')
install=$pkgname.install
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('7b20e59ca271c755400f68446f1f818d4ee3cc7e7e8fa7ba67a843a4eabdecc1')

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
