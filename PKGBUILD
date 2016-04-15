pkgbase=python-salib
pkgname=('python-salib' 'python2-salib')
pkgver=0.7.1
pkgrel=1
pkgdesc="Sensitivity Analysis Library in Python (Numpy). Contains Sobol, Morris, and FAST methods."
url="https://github.com/jdherman/SALib"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-scikit-learn' 'python2-scikit-learn')
source=("https://github.com/jdherman/SALib/archive/v$pkgver.tar.gz")
sha1sums=('0e681052d8dfecac4caf746b6ebf1702996773ef')

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

