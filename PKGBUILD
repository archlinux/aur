# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mleap
pkgver=0.23.0
pkgrel=1
pkgdesc='Common serialization format and execution engine for machine learning
pipelines (Python API)'
arch=('x86_64')
url='https://combust.github.io/mleap-docs/'
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-six' 'python-scipy' 'python-pandas'
         'python-scikit-learn')
optdepends=()
makedepends=('python' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver::https://pypi.org/packages/source/m/mleap/mleap-$pkgver.tar.gz")
sha256sums=('2e9a363419ec686a01a8dcf1090f73dadda8b77e09f14a7c0c6aa3059de1cb9f')
_pkgname=mleap

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
