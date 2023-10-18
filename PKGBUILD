# Maintainer: piernov <piernov@piernov.org>

pkgname=python-lightning-flash
pkgver=0.8.2
pkgrel=1
pkgdesc="High-level deep learning framework for fast prototyping, baselining, finetuning and solving deep learning problems."
arch=('any')
url="https://github.com/PyTorchLightning/lightning-flash"
license=('APACHE')
depends=('python-numpy' 'python-pytorch' 'python-torchmetrics' 'python-pytorch-lightning' 'python-pydeprecate' 'python-pandas' 'python-jsonargparse' 'python-click' 'python-protobuf' 'python-fsspec' 'python-lightning-utilities')
optdepends=(
	'python-torchvision: image support'
	'python-timm: image support'
	'python-pillow: image support'
	'python-kornia: image support'
	'python-pystiche: image support'
	'python-segmentation-models-pytorch: image support')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyTorchLightning/lightning-flash/archive/refs/tags/$pkgver.tar.gz")
md5sums=('eeb5b40d6e9820c6fffc813416b47a36')

build() {
  cd "$srcdir"/lightning-flash-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/lightning-flash-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
