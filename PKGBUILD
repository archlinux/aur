pkgbase=python-salib
pkgname=('python-salib' 'python2-salib')
pkgver=0.4
pkgrel=1
pkgdesc="Sensitivity Analysis Library in Python (Numpy). Contains Sobol, Morris, and FAST methods."
url="https://github.com/jdherman/SALib"
arch=(any)
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/jdherman/SALib/archive/v$pkgver.tar.gz")
md5sums=('6f93928c45a43c2cffa0512fda407100')

build() {
  cp -r "${srcdir}"/SALib-$pkgver "${srcdir}"/SALib-$pkgver-py2

  cd "${srcdir}"/SALib-$pkgver
  python setup.py build

  cd "${srcdir}"/SALib-$pkgver-py2
  python2 setup.py build
}

package_python-salib() {
  depends=('python-scikit-learn')

  cd "${srcdir}/SALib-$pkgver"
  python setup.py install --root=${pkgdir}
}

package_python2-salib() {
  depends=('python2-scikit-learn')

  cd "${srcdir}/SALib-$pkgver"
  python2 setup.py install --root=${pkgdir}
}
