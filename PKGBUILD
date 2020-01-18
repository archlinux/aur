# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mleap
pkgver=0.15.0
pkgrel=1
pkgdesc='Common serialization format and execution engine for machine learning
pipelines (Python API)'
arch=('x86_64')
url='https://mleap-docs.combust.ml'
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-six' 'python-scipy' 'python-pandas'
         'python-scikit-learn' 'python-nose-exclude')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/combust/mleap/archive/v$pkgver.tar.gz")
sha256sums=('e88f4edd4c50cf74d6c01d18f70c15f5dd3a8c1cd2fdfeb4889c3e4a17c83b44')

_pkgname=mleap

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/python"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
