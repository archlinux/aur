# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-linear-operator
pkgver=0.4.0
pkgrel=1
pkgdesc='A LinearOperator implementation to wrap the numerical nuts and bolts of
GPyTorch'
arch=('x86_64')
url='https://github.com/cornellius-gp/linear_operator/'
license=('MIT')
depends=('python' 'python-pytorch' 'python-scipy')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-setuptools-scm')
source=("$pkgname-$pkgver::git+https://github.com/cornellius-gp/linear_operator.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
