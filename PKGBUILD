# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-batchgenerators
_pkg="${pkgname#python-}"
pkgver=0.24
pkgrel=2
pkgdesc='Framework for data augmentation for 2D and 3D image classification and segmentation'
arch=('any')
url='https://github.com/MIC-DKFZ/batchgenerators'
license=('Apache')
depends=(
  'python-numpy'
  'python-pillow'
  'python-scikit-image'
  'python-scikit-learn'
  'python-scipy'
  'python-threadpoolctl')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('2e09650e3434b1ba91da907d444e360cb570ae05127b457e68d568a8d660be97')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
