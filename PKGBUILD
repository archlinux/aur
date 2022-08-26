# Maintainer: Tommy Li <ttoo74@gmail.com>
pkgname=python-d2l
_name=d2l
pkgver=0.17.5
pkgrel=1
pkgdesc="Dive into Deep Learning Book Utilities"
arch=(any)
url="http://d2l.ai/"
license=('Apache')
depends=(
    "ipython"
    "python-pandas"
    "python-matplotlib"
    "python-requests"
)
makedepends=("python")
optdepends=(
    "python-pytorch: PyTorch"
    "python-torchvision: PyTorch"
    "mxnet: MXNet"
    "python-tensorflow: TensorFlow"
)
source=("https://files.pythonhosted.org/packages/source/d/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('aee5553431a68246ca315920aaa4d295f6243bf94f8fd0e22b28b9933695d89e')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
