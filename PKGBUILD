pkgname=python-anyqt
pkgver=0.0.11
pkgrel=1
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
md5sums=('1e301e94ee6cf196ebc909a8ed77c252')


build() {
  cp -r "${srcdir}"/AnyQt-$pkgver "${srcdir}"/AnyQt-$pkgver-py2

  cd "${srcdir}"/AnyQt-$pkgver
  python setup.py build

  cd "${srcdir}"/AnyQt-$pkgver-py2
  python2 setup.py build
}

package() {
  cd "${srcdir}/AnyQt-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


