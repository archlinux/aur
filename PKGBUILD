# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=0.9
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
  '42b24775c61fb294f9cc93b8fb1987dd03cdb65a041b41549289b7a8005417a4'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
