pkgname=python-vispy
pkgver=v0.6.1
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='http://vispy.org'
license=('BSD')
depends=('python-numpy')
optdepends=('python-pyside2: a possible backend'
            'python-pyqt5: a possible backend')
source=("git://github.com/vispy/vispy.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/vispy"
  python setup.py build
}

package() {
  cd "$srcdir/vispy"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
