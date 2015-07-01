pkgname=python2-runsnakerun
pkgver=2.0.4
pkgrel=1
pkgdesc="GUI Viewer for Python profiling runs"
arch=('any')
url="http://www.vrplumber.com/programming/runsnakerun/"
license=('BSD')
depends=('python2-squaremap' 'wxpython2.8')
source=("http://pypi.python.org/packages/source/R/RunSnakeRun/RunSnakeRun-$pkgver.tar.gz"
        "wx.patch")

build() {
  cd "$srcdir/RunSnakeRun-$pkgver"

  msg "Patching source code..."
  patch -p0 < ${srcdir}/wx.patch

  msg "Building..."
  python2 setup.py build
}

package() {
  cd "$srcdir/RunSnakeRun-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}

md5sums=('3220b5b89994baee70b1c24d7e42a306'
         '6d00db360df47ae79f52e398bf23f845')
