# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=python-vpython
_name=${pkgname#python-}
pkgver=7.6.4
pkgrel=2
pkgdesc='VPython for Jupyter Notebook'
arch=('any')
url='https://pypi.org/project/vpython'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-build' 'python-pdm' 'cython' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('162ed54db313e5f87f9704b13942d3a0c7ad2da88b287d3baeb46e0eba7ffccc')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

