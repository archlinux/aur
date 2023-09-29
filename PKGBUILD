# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname='python-nntoolkit'
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Toolkit to train neural networks"
arch=('any')
url="https://pypi.org/project/$_name/"
license=('MPL-2.0')
depends=('python>=3.6.0' 'python-numpy' 'cython' 'python-h5py' 'python-keras' 'python-natsort' 'python-pytest' 'python-pyaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f9cf5b1cc6ad4c2b778c945959f0afc60619a62bec0eefacef4b28fb4f44f88d')

build(){
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
