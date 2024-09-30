# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=scikit-base
pkgname=python-${_name,,}
pkgver=0.10.1
pkgrel=1
pkgdesc='Base classes for sklearn-like parametric objects'
arch=('any')
url="https://github.com/sktime/skbase"
license=('BSD-3-Clause')
depends=('python' 'python-numpy' 'python-scipy' 'python-scikit-learn' 'python-numba')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=(0a4c215dc0a6efd17e450d9272e5f4e2edec741cba1a4ac5bed3fb50678451f8)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python$_python_version/site-packages/docs
}
