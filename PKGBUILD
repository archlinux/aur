# Maintainer: piernov <piernov@piernov.org>

pkgname=python-effdet
pkgver=0.2.4
pkgrel=1
pkgdesc="PyTorch implementation of EfficientDet"
arch=('any')
url="https://github.com/rwightman/efficientdet-pytorch"
license=('APACHE')
depends=('python-numpy' 'python-timm' 'python-pytorch' 'python-pyyaml' 'python-torchvision')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rwightman/efficientdet-pytorch/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('0eee80ebdf8f9b5d3be772017a3a638e')

build() {
  cd "$srcdir"/efficientdet-pytorch-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/efficientdet-pytorch-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
