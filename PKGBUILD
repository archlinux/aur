# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: Tommy Li <ttoo74@gmail.com>
pkgname=python-d2l
_name=d2l
pkgver=1.0.3
pkgrel=1
pkgdesc="Dive into Deep Learning Book Utilities"
arch=(any)
url="http://d2l.ai/"
license=('Apache')
depends=(
    "python-matplotlib"
    "python-matplotlib-inline"
    "python-numpy"
    "python-pandas"
    "python-requests"
    "python-scipy"
)
optdepends=(
    "python-pytorch: PyTorch"
    "python-torchvision: PyTorch"
    "mxnet: MXNet"
    "python-tensorflow: TensorFlow"
    "python-jax: JAX"
)
makedepends=(
    python-build
    python-installer
    python-wheel
)

source=("https://files.pythonhosted.org/packages/source/d/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b69964354f8150d1ae02166d1eccd622c61f330bf61a23bae614be4fb59ce3be')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
