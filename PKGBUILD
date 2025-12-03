# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=scikit-base
pkgname=python-${_name,,}
pkgver=0.13.0
pkgrel=1
pkgdesc='Base classes for sklearn-like parametric objects'
arch=('any')
url="https://github.com/sktime/skbase"
license=('BSD-3-Clause')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-numba')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=(efe7df0f09854b9f28e9532f6be87ef433dd8f1358cabd24ebf168aa4ccca1fc)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python$_python_version/site-packages/docs
}
