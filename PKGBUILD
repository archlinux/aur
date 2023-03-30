# Maintainer: Caleb Maclennan <caleb@alerque.com>

_py_name=exif
pkgname=python-$_py_name
pkgver=1.6.0
pkgrel=1
pkgdesc='Read and modify image EXIF metadata'
arch=(any)
url="https://gitlab.com/TNThieding/$_py_name"
license=(MIT)
_py_deps=(plum)
depends=(python
         "${_py_deps[@]/#/python-}")
_archive="$_py_name-$pkgver"
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_py_name::1}/$_py_name/$_archive.tar.gz")
sha256sums=('36288d1ffc60030084a04c26f50cc32e19383a36cd234fcfa1fb1c6f698e1d36')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
