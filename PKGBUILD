# Maintainer: Dylan Ferris <dylan@psilly.com>

pkgname='atlas-cpp'
pkgver=0.6.3
pkgrel=1
pkgdesc='The C++ reference implementation of the WorldForge Atlas protocol.'
arch=('x86_64')
url='http://www.worldforge.org/index.php/components/atlas-cpp/'
license=('GPL2')
source=("https://github.com/worldforge/$pkgname/archive/$pkgver.tar.gz")
md5sums=('278e8c23e61720b165a62f64e74e9f8b')

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
