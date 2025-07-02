# Maintainer: piernov <piernov@piernov.org>

pkgname=python-effdet
_pkgname=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="PyTorch implementation of EfficientDet"
arch=('any')
url="https://github.com/rwightman/efficientdet-pytorch"
license=('APACHE')
depends=('python-numpy' 'python-timm' 'python-pytorch' 'python-pyyaml' 'python-torchvision' 'python-omegaconf' 'python-pycocotools')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('ae03eb13c2e74c2d9d042c51d55b6e33')

build() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
