# Maintainer: Dylan Ferris <dylan@psilly.com>

pkgname='atlas-cpp'
pkgver=0.6.4
pkgrel=1
pkgdesc='The C++ reference implementation of the WorldForge Atlas protocol.'
arch=('x86_64')
url='https://www.worldforge.org/index.php/components/atlas-cpp/'
license=('GPL2')
source=("https://github.com/worldforge/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('74debbf2706b8a17bee5c715d026a6a1e51ee315685761fba378ea3564cde481')

build() {
  cd $srcdir/$pkgname-$pkgver
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  ./configure
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
