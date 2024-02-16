# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=python-magika
pkgver=0.5.0
pkgrel=1
pkgdesc="Detect file content types with deep learning"
arch=(any)
url="https://github.com/google/magika"
license=('Apache-2.0')
depends=('python' 'python-click' 'python-tqdm' 'python-onnxruntime' 'python-numpy' 'python-tabulate' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/google/magika/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/magika-${pkgver}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/magika-${pkgver}/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
