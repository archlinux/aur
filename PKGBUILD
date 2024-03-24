# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=python-magika
pkgver=0.5.1
pkgrel=1
pkgdesc="Detect file content types with deep learning"
arch=(any)
url="https://github.com/google/magika"
license=('Apache-2.0')
depends=('python' 'python-click' 'python-tqdm' 'python-onnxruntime' 'python-numpy' 'python-tabulate' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("https://github.com/google/magika/archive/refs/tags/python-v${pkgver}.tar.gz")
sha256sums=('bef690b9cd00d68335020dd053c8e8234aef61f59dff18f71b82873732d81059')

build() {
  cd "${srcdir}/magika-python-v${pkgver}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/magika-python-v${pkgver}/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
