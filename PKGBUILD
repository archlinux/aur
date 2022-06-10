# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pystiche
pkgver=1.0.1
pkgrel=1
pkgdesc="Framework for Neural Style Transfer (NST) built upon PyTorch"
arch=('any')
url="https://github.com/pystiche/pystiche"
license=('BSD')
depends=('python-pytorch' 'python-torchvision' 'python-pillow' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("git+https://github.com/pystiche/pystiche.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/pystiche
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/pystiche
  python -m installer --destdir="$pkgdir" dist/*.whl
}
