# Maintainer: piernov <piernov@piernov.org>

pkgname=python-lightning-flash
pkgver=0.7.5
pkgrel=1
pkgdesc="High-level deep learning framework for fast prototyping, baselining, finetuning and solving deep learning problems."
arch=('any')
url="https://github.com/PyTorchLightning/lightning-flash"
license=('APACHE')
depends=('python-numpy' 'python-pytorch' 'python-torchmetrics' 'python-pytorch-lightning' 'python-pydeprecate' 'python-pandas' 'python-jsonargparse' 'python-click' 'python-protobuf')
optdepends=(
	'python-torchvision: image support'
	'python-timm: image support'
	'python-pillow: image support'
	'python-kornia: image support'
	'python-pystiche: image support'
	'python-segmentation-models-pytorch: image support')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyTorchLightning/lightning-flash/archive/refs/tags/$pkgver.tar.gz")
md5sums=('fbfa7ee774a0cd1553bbe24afd9bacd0')

build() {
  cd "$srcdir"/lightning-flash-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/lightning-flash-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
