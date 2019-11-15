# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-gpflow
_pkgver=2.0.0
_pkgrc=rc1
pkgver=${_pkgver}${_pkgrc}
pkgrel=2
pkgdesc="Gaussian process methods in tensorflow"
url="https://github.com/GPflow/GPflow"
arch=('any')
license=('MIT')
depends=('python-numpy>=1.10.0' 'python-scipy>=0.18.0' 'python-multipledispatch>=0.4.9' 'python-tensorflow>=2.0.0' 'python-tensorflow-probability>=0.8' 'python-tabulate')
checkdepends=('python-pytest')
makedepends=('python-setuptools')
source=("https://github.com/GPflow/GPflow/archive/${_pkgver}-${_pkgrc}.tar.gz")
sha256sums=('e0ee90e6b999649a5f9a9bb4f27e000ce6b7ee45e6e8aa97d291d463db697a7d')

build() {
  cd "${srcdir}"/GPflow-${_pkgver}-${_pkgrc}
  python setup.py build
}

package() {
  cd "${srcdir}"/GPflow-${_pkgver}-${_pkgrc}
  python setup.py install --root=${pkgdir} --optimize=1
}
