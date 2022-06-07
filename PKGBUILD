# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname='python2-funcsigs'
_name="${pkgname#python2-}"
pkgver=1.0.2
pkgrel=3
pkgdesc='Python function signatures from PEP362'
arch=('any')
url="https://pypi.python.org/pypi/${_name}/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
# checkdepends=('python2-nose' 'python2-unittest2')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('3006d46018ae040b930e397c3f11575ae0ef18a8b2c9b6c10075804d83d23bea1fb81179de85180146673e0bd4c775a68c0ff624cdaceb1894efe5b2c8fd753c')

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}"  --optimize=1
}

# check() {
#   cd "${_tarname}/tests"
#   nosetests2 .
# }
