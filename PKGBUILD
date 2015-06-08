pkgbase=python-hope
pkgname=('python-hope' 'python2-hope')
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python Just-In-Time compiler for astrophysical computations"
url="https://github.com/cosmo-ethz/hope"
arch=(any)
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/cosmo-ethz/hope/archive/${pkgver}.tar.gz")
md5sums=('d08bb1d5b6b41063cbc5d3d7101da9f0')

build() {
  cp -r "${srcdir}"/hope-$pkgver "${srcdir}"/hope-$pkgver-py2

  cd "${srcdir}"/hope-$pkgver
  python setup.py build

  cd "${srcdir}"/hope-$pkgver-py2
  python2 setup.py build
} 

package_python-hope() {
  depends=('python-numpy' 'python-sympy')

  cd "${srcdir}"/hope-$pkgver
  python setup.py install --root="${pkgdir}"
}

package_python2-hope() {
  depends=('python2-numpy' 'python2-sympy')

  cd "${srcdir}"/hope-$pkgver-py2
  python2 setup.py install --root="${pkgdir}"
}
