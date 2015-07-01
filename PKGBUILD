# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
_pkgname=mousetrap
pkgname=gnome-$_pkgname
pkgver=3.17.1
_pkgver=MOUSETRAP_${pkgver//\./_}
pkgrel=2
pkgdesc="a standalone GNOME application that allows users with physical impairments to move a mouse cursor"
arch=('any')
url="https://wiki.gnome.org/Projects/MouseTrap"
license=('GPL2')
depends=('python2' 'python2-yaml' 'opencv' 'python2-xlib' 'python2-numpy')
makedepends=('gnome-common')
options=(!emptydirs)
source=(https://github.com/GNOME/$_pkgname/archive/$_pkgver.tar.gz)
md5sums=('8d829608e31cc60916360716c10d06b1')

build() {
  cd "$srcdir/$_pkgname-$_pkgver/"
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
