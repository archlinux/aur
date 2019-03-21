pkgname=python-pushetta
pkgver=1.0.15
pkgrel=1
pkgdesc="Pushetta Python Client"
url="https://github.com/guglielmino/pushetta-py"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.python.org/packages/1b/af/f1d0d56f9e55a2f1270c324e174492454488663dbcd9a196a969cd81088f/pushetta-1.0.15.tar.gz")
md5sums=('fa7a741800b88b89bcb4fbeee3b03f61')

prepare() {
  cd "${srcdir}"/pushetta-$pkgver
}

build() {
  cd "${srcdir}"/pushetta-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/pushetta-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  rm -r "${pkgdir}"/usr/lib/python*/site-packages/examples
}


