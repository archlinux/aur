# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>
# Contributor: Baptiste Jonglez <zerstorer at free dot fr>

pkgbase=python-gnuplot
pkgname=('python2-gnuplot' 'python-gnuplot')
pkgver=1.8
pkgrel=8
pkgdesc='Plot graphs with Gnuplot'
arch=('any')
license=('LGPL')
url='https://gnuplot-py.sourceforge.net/'
makedepends=('git' 'python-numpy' 'python-setuptools' 'python2-numpy' 'python2-setuptools')
source=("https://downloads.sourceforge.net/gnuplot-py/gnuplot-py-$pkgver.tar.gz"
        "git+https://github.com/yuyichao/gnuplot-py.git#commit=2c2218dc67") # python 3 port
sha256sums=('ab339be7847d30a8acfd616f27b5021bfde0999b7bf2d68400fbe62c53106e21'
            'SKIP')

package_python2-gnuplot() {
  depends=('python2' 'python2-numpy' 'gnuplot')

  cd "gnuplot-py-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python-gnuplot() {
  depends=('python' 'python-numpy' 'gnuplot')

  cd gnuplot-py

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: ts=2 sw=2 et:
