pkgname=python-anyqt
pkgver=0.0.8
pkgrel=1
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
md5sums=('7154018b06770d958659faa8f89c7b9a')


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


