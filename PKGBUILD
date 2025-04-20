# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-pyssim
_name=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc='Module for computing Structured Similarity Image Metric (SSIM) in Python'
arch=(any)
url='https://github.com/jterrace/pyssim'
license=(MIT)
depends=(python python-pillow python-scipy python-numpy)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('06b07a0bb10fd4e0c556b3f0f2d3eda9fdbcc49b9a0e519b1acbddee01f1e670c4233c4a6b8766eeff3d0682a52d4518174f749ef965ce32fbe434ab5b0c32f8')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
