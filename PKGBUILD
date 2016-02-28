# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: ra_fi <radu_f@gmx.de>

pkgname=usbprog
pkgver=0.2.1
pkgrel=1
pkgdesc="Flashtool for the USBprog Programming Adapter"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.embedded-projects.net/usbprog/"
depends=('libusb-compat' 'curl' 'wxgtk')
source=('hg+https://bitbucket.org/bwalle/usbprog-tools-classic#revision=b833a72')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/usbprog-tools-classic"

  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
}

build() {
  cd "$srcdir/usbprog-tools-classic"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/usbprog-tools-classic"

  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
