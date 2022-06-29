# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arvedui <arvedui@posteo.de>

pkgname=python2-retrying
_name=${pkgname#python2-}
pkgver=1.3.3
pkgrel=13
pkgdesc='A general purpose Python retyring library (Python 2 package)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
  'python2'
  'python-six'
)
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("${_tarname}::https://github.com/rholder/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2c518ca887dddc35bad421ad75c76cb88f08a0965272816af8667b1b151eca2dda1b0b198607f26dcda2df547ba2cb317ac927ebfc5891cd8c6203ded619f1e1')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  python2 setup.py test
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
