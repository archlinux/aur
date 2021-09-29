# Maintainer: piernov <piernov@piernov.org>

pkgname=python-neptune-pytorch-lightning
pkgver=0.9.7
pkgrel=1
pkgdesc="Neptune.ai PyTorch Lightning integration library"
arch=('x86_64')
url="https://github.com/neptune-ai/neptune-pytorch-lightning"
license=('APACHE')
depends=('python-pytorch-lightning' 'python-neptune-client')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neptune-ai/neptune-pytorch-lightning/archive/refs/tags/$pkgver.tar.gz")
md5sums=('0f6baab4148e247dea48db62013440b6')

build() {
  cd "$srcdir"/neptune-pytorch-lightning-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/neptune-pytorch-lightning-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
