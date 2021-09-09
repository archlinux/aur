# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=1.9.1
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
optdepends=('python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('8f835049fb88c0ad0ed82f0ad16a7073')

package() {
  cd "$srcdir/YODA-$pkgver"

  # ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
  # ## will eventually be fixed upstream (1.9.x)
  touch pyext/yoda/*.pyx

  ./configure --prefix=/usr
  make DESTDIR="$pkgdir/" install
}
