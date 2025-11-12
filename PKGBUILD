# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=python-vpython
_name=${pkgname#python-}
pkgver=7.6.5
pkgrel=1
pkgdesc='VPython for Jupyter Notebook'
arch=('any')
url='https://pypi.org/project/vpython'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-pdm' 'cython' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('26d0fe4c4f253c36a570ade3924cee2423b2feb5e6082ff5d5f2eac093e746df')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

