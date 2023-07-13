# Maintainer: Blair Bonnett <blair dot bonnett at gmail>

pkgname=python-plyfile
pkgdesc="Read and write ASCII and binary PLY files"
pkgver=1.0
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
  'd6318ba75ff43fb0da5d7e1440630416222fc661e3b0605a05eac7fc4da31d8f'
)

build() {
  cd $_pypi-$pkgver
  python -m build --no-isolation --wheel
}

package() {
  cd $_pypi-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
