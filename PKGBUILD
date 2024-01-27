# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.0.3
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
  '0ecbe8e7ce55a7bbc6c9dea24242fffa0ab7d9bed33fbd5ad567ca013bcc5222'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
