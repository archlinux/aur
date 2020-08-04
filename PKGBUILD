# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-gputil
_name=GPUtil
pkgver=1.4.0
pkgrel=3
pkgdesc="A Python module for getting the GPU status from NVIDA GPUs using nvidia-smi"
arch=('any')
url="https://github.com/anderskm/gputil"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('099e52c65e512cdfa8c8763fca67f5a5c2afb63469602d5dcb4d296b3661efb9')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
