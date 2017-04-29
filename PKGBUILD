# Maintainer: David P. <megver83@parabola.nu>
# Contributor Evangelos Foutras <evangelos@foutrelis.com>

_pkgname=libgudev

pkgname=libgudev-nosystemd
pkgver=231
pkgrel=1
pkgdesc="GObject bindings for libudev"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/libgudev"
license=('LGPL2.1')
depends=('libeudev' 'glib2')
makedepends=('eudev' 'gobject-introspection' 'gtk-doc')
provides=('libgudev-1.0.so' "$_pkgname")
conflicts=("$_pkgname")
source=(https://download.gnome.org/sources/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.xz)
sha256sums=('3b1ef99d4a8984c35044103d8ddfc3cc52c80035c36abab2bcc5e3532e063f96')

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-gtk-doc \
    --disable-umockdev
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
