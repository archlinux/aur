# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-entropack
pkgver=0.1.8
pkgrel=1
_commit=137350a181526740dfafe4b1ea00bf56f4b18d45
pkgdesc='CUDA tensor compression library for PyTorch'
arch=(x86_64)
url='https://github.com/modelscope/entropack'
license=('Apache-2.0')
depends=(
  'python'
  'python-pytorch-cuda>=2.10'
  'python-numpy>=1.23'
  'python-dahuffman>=0.4'
  'python-cupy>=14'
)
makedepends=('python-build' 'python-installer' 'python-setuptools>=77.0.3' 'python-wheel')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('3c875c80d6ce4693b0ee2d54353a3530917ae6da342c713094a56c47441baa61')

build() {
  cd "entropack-$_commit"
  python -m build --wheel --no-isolation
}

package() {
  cd "entropack-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
