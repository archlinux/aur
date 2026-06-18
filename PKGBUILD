# Maintainer: Matias

_pkgname=rsclib
pkgname=python-rsclib
pkgver=0.68
pkgrel=1
pkgdesc="Miscellaneous basic utilities used by RSC tools"
arch=(any)
url="https://github.com/schlatterbeck/rsclib"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('23a5a44900fcaade622ad66ea8b057ff2e520d1f281710f388b2ba5f89cdef8e')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
