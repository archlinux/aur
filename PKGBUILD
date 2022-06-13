# Maintainer: piernov <piernov@piernov.org>

pkgname=python-yolov5-icevision
pkgver=6.0
pkgrel=1
_commit=e7ca90c5c9bc4921941fe5e32e1b88c0cf2946b6
pkgdesc="Family of object detection architectures and models pretrained on the COCO dataset"
arch=('any')
url="https://github.com/airctic/yolov5-icevision"
license=('GPL3')
depends=('python-matplotlib'
	'python-numpy'
	'python-opencv'
	'python-pillow'
	'python-pyyaml'
	'python-requests'
	'python-scipy'
	'python-pytorch'
	'python-torchvision'
	'python-tqdm'
	'tensorboard'
	'python-pandas'
	'python-seaborn'
	'python-pytorch-thop-git')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airctic/yolov5-icevision/archive/$_commit.zip")
md5sums=('a4b9f2d8d6207bcdc0bc433e8ce6b38b')

build() {
  cd "$srcdir"/yolov5-icevision-$_commit
  python setup.py build
}

package() {
  cd "$srcdir"/yolov5-icevision-$_commit
  python setup.py install --root="$pkgdir"/ --optimize=1
}
