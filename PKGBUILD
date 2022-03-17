# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=1.9.4
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('97637c32eb329c96c620d9f1f2e8203c')

package() {
  cd "$srcdir/YODA-$pkgver"

  # ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
  # ## will eventually be fixed upstream (1.9.x)
  touch pyext/yoda/*.pyx

  ./configure --prefix=/usr --sysconfdir=/etc
  make DESTDIR="$pkgdir/" install
}
