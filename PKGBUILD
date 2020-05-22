# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Tilman Blumenbach <tilman+aur@ax86.net>

pkgname=xcursor-openzone
pkgver=1.2.9
pkgrel=1
pkgdesc="OpenZone X11 cursor theme"
url='https://www.opendesktop.org/p/999999/'
arch=('any')
makedepends=('icon-slicer')
license=('custom:xcursor-openzone')
source=("git+https://github.com/ducakar/openzone-cursors.git#tag=v${pkgver:?}")
sha384sums=('SKIP')

build() {
  cd openzone-cursors
  make
}

package() {
  cd openzone-cursors
  make install DESTDIR=${pkgdir}/usr
  install -D -m644 COPYING "${pkgdir:?}/usr/share/licenses/${pkgname:?}/COPYING"
}

# vim: ts=2 sw=2 et
