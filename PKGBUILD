# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=scikit-base
pkgname=python-${_name,,}
pkgver=0.7.0
pkgrel=1
pkgdesc='Base classes for sklearn-like parametric objects'
arch=('any')
url="https://github.com/sktime/skbase"
license=('BSD-3-Clause')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-numba')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('41409a28e433d86339d7d8d47c7eba81047f483a46345703907c97caab36423e')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python$_python_version/site-packages/docs
}
