# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.1
pkgrel=1
url='https://github.com/dranjan/python-plyfile'
arch=('any')
license=('GPL-3.0-or-later')

depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-pdm-pep517' 'python-wheel')

_pypi=plyfile
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'a49bdf5285c95b6f7d4b9f2954b7867c44f8e13348606d886d8e0a561f6f4671'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
