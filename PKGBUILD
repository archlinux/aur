# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: ra_fi <radu_f@gmx.de>

pkgname=usbprog
pkgver=0.2.0
pkgrel=3
pkgdesc="Flashtool for the USBprog Programming Adapter"
arch=('i686' 'x86_64')
license="GPL"
url="http://www.embedded-projects.net/usbprog/"
depends=('libusb-compat' 'curl' 'wxgtk')
source=("http://bwalle.de/programme/usbprog/$pkgname-$pkgver.tar.bz2"
        'wxwidgets-3.0.patch')
md5sums=('114d7c3e1b3fa41391438fbf26cd2216'
         'a88ba5fa56cf08da3fb05ab46c21ce43')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../wxwidgets-3.0.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
