# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=0.8.1
pkgrel=1
url='https://github.com/dranjan/python-plyfile'
arch=('any')
license=('GPL3')

depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-pdm' 'python-wheel')

_pypi=plyfile
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'bc61bcb27f37eae77ca6ddb3347a9590271ffcd1c8d5b4d34da95fd58cfcc770'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
