# Maintainer: piernov <piernov@piernov.org>

pkgname=python-icevision
pkgver=0.12.0
pkgrel=1
pkgdesc="An Agnostic Computer Vision Framework"
arch=('any')
url="https://github.com/airctic/icevision"
license=('APACHE')
depends=('python-pytorch'
	'python-torchvision'
	'python-pillow'
	'python-fastcore'
	'python-tqdm'
	'python-opencv'
	'python-albumentations'
	'python-importlib-metadata'
	'python-ipykernel'
	'python-loguru'
	'python-resnest'
	'python-pycocotools'
	'python-effdet'
	'python-sahi'
	'python-yolov5-icevision')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'git')
source=("git+https://github.com/airctic/icevision.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir"/icevision
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir"/icevision
	python -m installer --destdir="$pkgdir" dist/*.whl
}
