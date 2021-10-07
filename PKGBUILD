# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mleap
pkgver=0.18.1
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
sha256sums=('fa60996ef64f7ba7593f35783469dcb5aab6955230319b849f1ccecfe3dc30b5')

_pkgname=mleap

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
