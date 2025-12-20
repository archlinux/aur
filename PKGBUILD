# Maintainer:
# Contributor: Aditya Dua <adityadua24@gmail.com>

pkgname=python-robopy
pkgver=1.0.8
pkgrel=2
pkgdesc="A Python 3 implementation of Peter Corke's Robotics Toolbox"
arch=(any)
url="https://github.com/adityadua24/robopy"
license=(MIT)
depends=(python python-imageio python-numpy python-setuptools python-scipy vtk)
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6571abc26b69c91e6f5fb4258c0193c5a98823e2f1f121ad78265067885c79bf')

build() {
  cd robopy-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd robopy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
