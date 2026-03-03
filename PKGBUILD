# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=python-bertviz
pkgver=1.4.1
pkgrel=1
pkgdesc="Tool for visualizing attention in the Transformer model"
arch=('any')
url="https://github.com/jessevig/bertviz"
license=('Apache-2.0')
depends=(
  'python'
  'python-transformers'
  'python-pytorch'
  'python-tqdm'
  'python-boto3'
  'python-requests'
  'python-regex'
  'python-sentencepiece'
  'python-ftfy'
  'python-numpy'
  'python-six'
  'ipython'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/9c/11/edd831ca9748c844e262cb6ae09d0827526b09e2ab004c3c59adb70f126e/bertviz-${pkgver}.tar.gz")
sha256sums=('28d5c350a45dd4ece16f74df3f44ed15548e3ebaf36d837ac93bc60a594bf07a')

build() {
  cd "bertviz-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "bertviz-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
