# sudacode <suda@sudacode.com>
pkgname=python-torch-summary
_name=${pkgname#python-}
pkgver=1.4.5
pkgrel=1
pkgdesc="Model summary in PyTorch, based off of the original torchsummary."
arch=('any')
url="https://pypi.org/project/torch-summary/"
license=('MIT')
depends=('python>=3.6')
makedepends=('python-build' 'python-wheel' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('44eac21777dbbda7b8404d57a43c09d83fd9c93d0c1f0c960b5083ccb24d6d21')

build() {
    cd "${_name/-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
