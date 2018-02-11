pkgbase=python-fdutil
pkgname=('python-fdutil' 'python2-fdutil')
pkgver=1.6.6
pkgrel=1
pkgdesc="A collection of python utilities for manipulating files and data"
url="https://bitbucket.org/davisowb/fdutil"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' python-pyperclip python-logging-helper python-conversionutil python-watchdog python-dominate python2-pyperclip python2-logging-helper python2-conversionutil python2-watchdog python2-dominate)
source=("https://pypi.io/packages/source/f/fdutil/fdutil-${pkgver}.tar.gz")
md5sums=('c63bc147c6062a05639bbb1413294c3f')


prepare() {
  cd "${srcdir}"/fdutil-$pkgver
}

build() {
  cp -r "${srcdir}"/fdutil-$pkgver "${srcdir}"/fdutil-$pkgver-py2

  cd "${srcdir}"/fdutil-$pkgver
  python setup.py build

  cd "${srcdir}"/fdutil-$pkgver-py2
  python2 setup.py build
}

package_python-fdutil() {
  depends=(python-pyperclip python-logging-helper python-conversionutil python-watchdog python-dominate)

  cd "${srcdir}/fdutil-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-fdutil() {
  depends=(python2-pyperclip python2-logging-helper python2-conversionutil python2-watchdog python2-dominate)

  cd "${srcdir}/fdutil-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

