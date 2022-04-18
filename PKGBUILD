# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mleap
pkgver=0.20.0
pkgrel=1
pkgdesc='Common serialization format and execution engine for machine learning
pipelines (Python API)'
arch=('x86_64')
url='https://combust.github.io/mleap-docs/'
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-six' 'python-scipy' 'python-pandas'
         'python-scikit-learn')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://pypi.org/packages/source/m/mleap/mleap-$pkgver.tar.gz")
sha256sums=('71e1e794dca351b2fc3dc4355b351d95a99f499e95843fe3c49bb6d421139b06')
_pkgname=mleap

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
