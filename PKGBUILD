pkgbase=python-salib
pkgname=('python-salib' 'python2-salib')
pkgver=1.0.0
pkgrel=1
pkgdesc="Sensitivity Analysis Library in Python (Numpy). Contains Sobol, Morris, and FAST methods."
url="https://github.com/jdherman/SALib"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy' 'python-pyscaffold' 'python2-pyscaffold')
source=("https://github.com/jdherman/SALib/archive/v$pkgver.tar.gz")
sha1sums=('cfe5c9ae82c11b69f0148e5590aaa5f90f638feb')

build() {
  cp -r "${srcdir}"/SALib-$pkgver "${srcdir}"/SALib-$pkgver-py2

  cd "${srcdir}"/SALib-$pkgver
  python setup.py build

  cd "${srcdir}"/SALib-$pkgver-py2
  python2 setup.py build
}

package_python-salib() {
  depends=('python-numpy')

  cd "${srcdir}/SALib-$pkgver"
  python setup.py install --root=${pkgdir}
}

package_python2-salib() {
  depends=('python2-numpy')

  cd "${srcdir}/SALib-$pkgver"
  python2 setup.py install --root=${pkgdir}
}

