# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=python-magika
pkgver=0.5.0
pkgrel=1
pkgdesc="Detect file content types with deep learning"
arch=(any)
url="https://github.com/google/magika"
license=('Apache-2.0')
depends=('python' 'python-click' 'python-tqdm' 'python-onnxruntime' 'python-numpy' 'python-tabulate' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("https://github.com/google/magika/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0f6b9c6f59d1372e17d3b71dc7b77206d66ed3f87c53eb1bd15904c2c6095ee')

build() {
  cd "${srcdir}/magika-${pkgver}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/magika-${pkgver}/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
