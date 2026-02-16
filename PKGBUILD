# Contributor:  Liam Timms <timms5000@gmail.com>
pkgname=python-ci-info
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python implementation of watson/ci-info. Data on Continuous Integration environment."
arch=('any')
url='https://github.com/mgxd/ci-info'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
optdepends=()
source=("${_name}-${pkgver}.tar.gz::https://github.com/mgxd/${_name}/archive/${pkgver}.tar.gz")
md5sums=('5953a0ab2e03b80ac7348c325c858d4c')

build() {
  cd "$srcdir/$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

