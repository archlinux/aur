# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mleap
pkgver=0.17.0
pkgrel=1
pkgdesc='Common serialization format and execution engine for machine learning
pipelines (Python API)'
arch=('x86_64')
url='https://mleap-docs.combust.ml'
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-six' 'python-scipy' 'python-pandas'
         'python-scikit-learn')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://pypi.org/packages/source/m/mleap/mleap-$pkgver.tar.gz")
sha256sums=('ea02da18676da893be91b12cca15f2aafdad8b34cf222a244b7c72533eae4818')

_pkgname=mleap

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
