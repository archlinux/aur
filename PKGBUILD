# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.0.2
pkgrel=1
url='https://github.com/dranjan/python-plyfile'
arch=('any')
license=('GPL3')

depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-pdm-pep517' 'python-wheel')

_pypi=plyfile
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '446691cfc8a453b8a0c6c394c42a7a28262da94ec2d12fa4d30998f78e8b1313'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
