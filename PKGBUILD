#$Id$
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor : Baptiste Jonglez <zerstorer at free dot fr>

pkgbase=python-gnuplot
pkgname=('python-gnuplot' 'python2-gnuplot')
pkgver=1.8
pkgrel=2
pkgdesc='Plot graphs with Gnuplot'
arch=('any')
license=('LGPL')
url='http://gnuplot-py.sourceforge.net/'
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://downloads.sourceforge.net/gnuplot-py/gnuplot-py-$pkgver.tar.gz")
sha256sums=('ab339be7847d30a8acfd616f27b5021bfde0999b7bf2d68400fbe62c53106e21')

build() {
  cp -a "gnuplot-py-$pkgver" "gnuplot-py2-$pkgver"
}

package_python2-gnuplot() {
  depends=('python2' 'gnuplot' 'python2-numpy')

  cd "gnuplot-py2-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python-gnuplot() {
  depends=('python' 'gnuplot' 'python-numpy')

  cd "gnuplot-py-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim:set ts=2 sw=2 et:
