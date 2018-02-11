pkgbase=python-timingsutil
pkgname=('python-timingsutil' 'python2-timingsutil')
pkgver=1.1.0
pkgrel=1
pkgdesc="A collection of timing utilities"
url="https://bitbucket.org/daycoder/timingsutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/t/timingsutil/timingsutil-${pkgver}.tar.gz")
md5sums=('61be8f435dcafa84b452b9062c8626e0')

prepare() {
  cd "${srcdir}"/timingsutil-$pkgver
}

build() {
  cp -r "${srcdir}"/timingsutil-$pkgver "${srcdir}"/timingsutil-$pkgver-py2

  cd "${srcdir}"/timingsutil-$pkgver
  python setup.py build

  cd "${srcdir}"/timingsutil-$pkgver-py2
  python2 setup.py build
}

package_python-timingsutil() {
  depends=('python-logging-helper')

  cd "${srcdir}/timingsutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-timingsutil() {
  depends=('python2-logging-helper')

  cd "${srcdir}/timingsutil-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

