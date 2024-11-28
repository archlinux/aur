# Maintainer: yznnyz <yzniu1@gmail.com>
# Maintainer: Butui Hu <hot123tea123@gmail.com>
_module='ml-collections'
pkgname=python-$_module
_src_folder='ml_collections-1.0.0'
pkgver='1.0.0'
pkgrel=1
pkgdesc="ML Collections is a library of Python collections designed for ML usecases."
url="None"
depends=(
  absl-py
  python-six
  python-yaml
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/31/f9/74689ff3e3ff6e4ec8616887cb00c9c66bca7e6243fd328358ea3665d547/ml_collections-1.0.0.tar.gz")
sha256sums=('00b11a1a339dd6c2d9b7f0daab47ab17e10e29ca1b2a656058605e2b7210897f')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
