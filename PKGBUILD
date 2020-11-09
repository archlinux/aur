# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mleap
pkgver=0.16.1
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
sha256sums=('a71b0b87bf904c2e7cd869841088f9166cce92fba05b52371c2c04d2c58d2547')

_pkgname=mleap

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
