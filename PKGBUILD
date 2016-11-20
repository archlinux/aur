pkgbase=python-pushetta
pkgname=('python-pushetta' 'python2-pushetta')
pkgver=1.0.15
pkgrel=1
pkgdesc="Pushetta Python Client"
url="https://github.com/guglielmino/pushetta-py"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/1b/af/f1d0d56f9e55a2f1270c324e174492454488663dbcd9a196a969cd81088f/pushetta-1.0.15.tar.gz")
md5sums=('fa7a741800b88b89bcb4fbeee3b03f61')

prepare() {
  cd "${srcdir}"/pushetta-$pkgver
}

build() {
  cp -r "${srcdir}"/pushetta-$pkgver "${srcdir}"/pushetta-$pkgver-py2

  cd "${srcdir}"/pushetta-$pkgver
  python setup.py build

  cd "${srcdir}"/pushetta-$pkgver-py2
  python2 setup.py build
}

package_python-pushetta() {
  depends=('python')

  cd "${srcdir}/pushetta-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pushetta() {
  depends=('python2')

  cd "${srcdir}/pushetta-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

