pkgbase=python-flask_cors
pkgname=('python-flask_cors' 'python2-flask_cors')
pkgver=3.0.2
pkgrel=1
pkgdesc="A Flask extension adding a decorator for CORS support"
url="https://github.com/corydolphin/flask-cors"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-flask' 'python2-flask' 'python-six' 'python2-six')
source=("https://github.com/corydolphin/flask-cors/archive/${pkgver}.tar.gz")
md5sums=('4128bfd92929beca457fd1fb5a2c7812')

prepare() {
  cd "${srcdir}"/flask-cors-$pkgver
}

build() {
  cp -r "${srcdir}"/flask-cors-$pkgver "${srcdir}"/flask-cors-$pkgver-py2

  cd "${srcdir}"/flask-cors-$pkgver
  python setup.py build

  cd "${srcdir}"/flask-cors-$pkgver-py2
  python2 setup.py build
}

package_python-flask_cors() {
  depends=('python-flask' 'python-six')

  cd "${srcdir}/flask-cors-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-flask_cors() {
  depends=('python2-flask' 'python2-six')

  cd "${srcdir}/flask-cors-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

