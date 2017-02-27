pkgbase=python-transitions
pkgname=('python-transitions' 'python2-transitions')
pkgver=0.4.3
pkgrel=1
pkgdesc="A lightweight, object-oriented finite state machine implementation in Python"
url="http://github.com/tyarkoni/transitions"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six')
source=("https://github.com/tyarkoni/transitions/archive/${pkgver}.tar.gz")
md5sums=('69af441d2ff8e7041f8d3cc6c92ad1d5')

prepare() {
  cd "${srcdir}"/transitions-$pkgver
}

build() {
  cp -r "${srcdir}"/transitions-$pkgver "${srcdir}"/transitions-$pkgver-py2

  cd "${srcdir}"/transitions-$pkgver
  python setup.py build

  cd "${srcdir}"/transitions-$pkgver-py2
  python2 setup.py build
}

package_python-transitions() {
  depends=('python-six')

  cd "${srcdir}/transitions-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-transitions() {
  depends=('python2-six')

  cd "${srcdir}/transitions-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

