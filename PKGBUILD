# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname='python-crossplane'
_name="${pkgname#python-}"
pkgver=0.5.7
pkgrel=1
pkgdesc='Reliable and fast NGINX configuration file parser and builder'
arch=('any')
url='https://pypi.org/project/crossplane/'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://pypi.python.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
b2sums=('0c661df50baee833f18a627075ed3fb2650263b8cde1a5b2e097dfce5d9fb51e37bb1b4bf7b6fc9b3b248b96034a69f8945f32fb99e932ba280606c8eb7c066b')

build() {
  cd "${_tarname}"
  python setup.py build
}

package() {
  cd "${_tarname}"
  python setup.py install --prefix='/usr' --root="${pkgdir}" --optimize 1
}
