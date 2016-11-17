pkgbase=python-pyorgmode
pkgname=('python-pyorgmode' 'python2-pyorgmode')
pkgver=0.1
pkgrel=1
pkgdesc="A python class for reading and writing orgmode files"
url="https://github.com/bjonnh/PyOrgMode"
arch=(any)
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/4f/81/e403d3c062000481e5d0b54167369a7b4d33a6e001ccc441bbefeb611600/PyOrgMode-0.1.tar.gz")
md5sums=('51db078517762018a8be341a0be71394')

build() {
  cp -r "${srcdir}"/PyOrgMode-$pkgver "${srcdir}"/PyOrgMode-$pkgver-py2

  cd "${srcdir}"/PyOrgMode-$pkgver
  python setup.py build

  cd "${srcdir}"/PyOrgMode-$pkgver-py2
  python2 setup.py build
}

package_python-pyorgmode() {
  depends=('python')

  cd "${srcdir}/PyOrgMode-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pyorgmode() {
  depends=('python2')

  cd "${srcdir}/PyOrgMode-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
