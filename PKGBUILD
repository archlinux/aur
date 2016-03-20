# Maintainer: Husam Bilal <husam212 AT gmail DOT com>
_name=furl
pkgname="python-${_name}"
pkgver=0.4.92
pkgrel=1
pkgdesc='Python library that makes manipulating URLs simple.'
url="https://github.com/gruns/furl"
depends=('python' 'python-six' 'python-orderedmultidict')
makedepends=('python')
license=('custom:UNLICENSE')
arch=('any')
source=("https://pypi.python.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('c6304750cba9db15ecbdea034a80e221')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
