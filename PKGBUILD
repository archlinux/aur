# Maintainer: Caleb Maclennan <caleb@alerque.com>

_py_name=exif
pkgname=python-$_py_name
pkgver=1.3.0
pkgrel=1
pkgdesc='Read and modify image EXIF metadata'
arch=(any)
url="https://gitlab.com/TNThieding/$_py_name"
license=(MIT)
_py_deps=(plum)
depends=(python "${_py_deps[@]/#/python-}")
_pkgdir="$_py_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_py_name::1}/$_py_name/$_pkgdir.tar.gz")
sha256sums=('f772e849a0e14bb572ef151840e160f55c6602c50992e0f9781502cba1ee65a2')

build() {
    cd "$_pkgdir"
    python setup.py build
}

package() {
    cd "$_pkgdir"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
